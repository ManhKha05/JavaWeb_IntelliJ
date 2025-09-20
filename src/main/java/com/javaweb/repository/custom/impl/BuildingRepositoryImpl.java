package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        String staffId = MapUtils.getObject(buildingSearchRequest.getStaffId(), String.class);
        if(staffId != null) {
            sql.append("JOIN assignmentbuilding ON b.id = assignmentbuilding.buildingid ");
        }
    }

    public static void queryNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        try{
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for(Field field : fields) {
                field.setAccessible(true);
                String name = field.getName();
                if(!name.startsWith("area") && !name.startsWith("rentPrice")
                        && !name.equals("staffId") && !name.equals("typeCode")) {
                    Object value = field.get(buildingSearchRequest);
                    if(value != null && !value.equals("")) {
                        if(field.getType().equals(Integer.class) ||  field.getType().equals(Long.class)) {
                            where.append(" AND b." + name + " = " +  value + " ");
                        }
                        else if(field.getType().equals(String.class)) {
                            where.append(" AND b." + name + " LIKE '%" +  value + "%' ");
                        }
                    }
                }
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static void querySpecial(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        String staffId = MapUtils.getObject(buildingSearchRequest.getStaffId(), String.class);
        if(staffId != null) {
            where.append(" AND assignmentbuilding.staffid = " + staffId + " ");
        }
        List<String> typeCodes = buildingSearchRequest.getTypeCode();
        if(typeCodes != null && !typeCodes.isEmpty()) {
            where.append("AND (");
            String types = typeCodes.stream().map(it -> "( b.type LIKE '%" + it + "%' )").collect(Collectors.joining(" OR "));
            where.append(types + ") ");
        }
        Long rentPriceFrom = MapUtils.getObject(buildingSearchRequest.getRentPriceFrom(), Long.class);
        Long rentPriceTo = MapUtils.getObject(buildingSearchRequest.getRentPriceTo(), Long.class);
        if(rentPriceFrom != null || rentPriceTo != null) {
            if(rentPriceFrom != null){
                where.append("AND b.rentprice >= " + rentPriceFrom + " ");
            }
            if(rentPriceTo != null){
                where.append("AND b.rentprice <= " + rentPriceTo + " ");
            }
        }
        Long areaFrom = MapUtils.getObject(buildingSearchRequest.getAreaFrom(), Long.class);
        Long areaTo = MapUtils.getObject(buildingSearchRequest.getAreaTo(), Long.class);
        if(areaFrom != null || areaTo != null) {
            where.append("AND EXISTS ( SELECT * FROM rentarea WHERE b.id = rentarea.buildingid ");
            if(areaFrom != null) {
                where.append("AND rentarea.value >= " + areaFrom + " ");
            }
            if(areaTo != null) {
                where.append("AND rentarea.value <= " + areaTo + " ");
            }
            where.append(") ");
        }
    }

    @Override
    public List<BuildingEntity> findBuildings(BuildingSearchRequest buildingSearchRequest) {
        StringBuilder sql = new StringBuilder("SELECT * FROM building b ");
        joinTable(buildingSearchRequest, sql);
        StringBuilder where = new StringBuilder("WHERE 1 = 1 ");
        queryNormal(buildingSearchRequest, where);
        querySpecial(buildingSearchRequest, where);
        sql.append(where.toString());
        sql.append(" GROUP BY b.id ");

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);

        return query.getResultList();
    }
}

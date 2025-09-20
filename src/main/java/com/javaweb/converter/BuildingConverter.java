package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.District;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse convertBuildingSearch(BuildingEntity buildingEntity){
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);

        String district = District.findDistrictNameByCode(buildingEntity.getDistrict());
        buildingSearchResponse.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + district);

        List<RentAreaEntity> rentAreas = buildingEntity.getRentAreas();
        String rentArea = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        buildingSearchResponse.setRentArea(rentArea);

        return buildingSearchResponse;
    }

    public BuildingDTO convertBuildingDTO(BuildingEntity buildingEntity){
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);

        List<RentAreaEntity> rentAreas = buildingEntity.getRentAreas();
        String areas = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        buildingDTO.setRentArea(areas);

        List<String> typeCodes = Arrays.asList(buildingEntity.getTypeCode().split(","));
        buildingDTO.setTypeCode(typeCodes);

        return buildingDTO;
    }

    public BuildingEntity convertBuildingEntity(BuildingDTO buildingDTO){
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);

        String typeCodes = buildingDTO.getTypeCode().stream().collect(Collectors.joining(","));
        buildingEntity.setTypeCode(typeCodes);

        return buildingEntity;
    }
}

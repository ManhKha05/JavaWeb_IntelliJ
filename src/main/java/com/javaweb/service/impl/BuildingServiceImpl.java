package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingServiceImpl implements BuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BuildingConverter buildingConverter;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = building.getUserEntities();
        List<StaffResponseDTO>  staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity user : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(user.getId());
            staffResponseDTO.setFullName(user.getFullName());
            if(staffAssignment.contains(user)) {
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");

        return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> findBuildings(BuildingSearchRequest  buildingSearchRequest) {
        List<BuildingEntity> buildingEntities = buildingRepository.findBuildings(buildingSearchRequest) ;
        List<BuildingSearchResponse> buildingResponseDTOS = new ArrayList<>();
        for(BuildingEntity buildingEntity : buildingEntities){
            BuildingSearchResponse buildingResponseDTO = buildingConverter.convertBuildingSearch(buildingEntity);

            buildingResponseDTOS.add(buildingResponseDTO);
        }
        return buildingResponseDTOS;
    }

    @Override
    @Transactional
    public void deleteBuildings(List<Long> ids) {
        buildingRepository.deleteByIdIn(ids);
    }

    @Override
    public BuildingDTO findBuildingById(Long id) {
        BuildingEntity building = buildingRepository.findById(id).get();
        BuildingDTO buildingDTO = buildingConverter.convertBuildingDTO(building);
        return buildingDTO;
    }

    @Override
    public void addOrUpdateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.convertBuildingEntity(buildingDTO);
        buildingEntity.getRentAreas().clear();
        if(!buildingDTO.getRentArea().equals("")){
            String[] areas = buildingDTO.getRentArea().split(",");
            for(String area : areas){
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(Long.parseLong(area.trim()));
                rentAreaEntity.setBuilding(buildingEntity);
                buildingEntity.getRentAreas().add(rentAreaEntity);
            }
        }
        buildingRepository.save(buildingEntity);
    }

    @Override
    public void assignBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        buildingEntity.getUserEntities().clear();
        List<UserEntity> staffs = userRepository.findByIdIn(assignmentBuildingDTO.getStaffs());
        for(UserEntity staff : staffs){
            buildingEntity.getUserEntities().add(staff);
        }
        buildingRepository.save(buildingEntity);
    }


}

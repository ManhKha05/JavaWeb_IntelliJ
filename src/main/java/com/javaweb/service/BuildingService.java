package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface BuildingService {
    ResponseDTO listStaffs(Long buildingId);

    List<BuildingSearchResponse> findBuildings(BuildingSearchRequest buildingSearchRequest);
    void deleteBuildings(List<Long> ids);
    BuildingDTO findBuildingById(Long id);
    void addOrUpdateBuilding(BuildingDTO buildingDTO);
    void assignBuilding(AssignmentBuildingDTO  assignmentBuildingDTO);
}

package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/admin/building")
public class BuildingAPI {

    @Autowired
    private BuildingService buildingService;

    @PostMapping
    public void addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        //Xuong DB để Update hoặc thêm mới
        buildingService.addOrUpdateBuilding(buildingDTO);
        System.out.println("Add or Update Building Success");
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable List<Long> ids) {
        //Xuong DB xoa building theo dsach id gui ve
        buildingService.deleteBuildings(ids);
        System.out.println("Delete Success");
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = buildingService.listStaffs(id);

        return result;
    }

    @PostMapping("/assignment")
    public void assignBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        buildingService.assignBuilding(assignmentBuildingDTO);
        System.out.println("Assign Building Success");
    }

}

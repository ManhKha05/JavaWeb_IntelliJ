package com.javaweb.controller.admin;



import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    private UserService userService;

    @Autowired
    private BuildingService buildingService;

    @GetMapping(value = "/admin/building-list")
    public String buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, Model model) {
        //Xuong DB lay data
        List<BuildingSearchResponse> responseList = buildingService.findBuildings(buildingSearchRequest);

        model.addAttribute("modelSearch", buildingSearchRequest);
        model.addAttribute("buildingList", responseList);
        model.addAttribute("listStaffs", userService.getStaffs());
        model.addAttribute("districts", District.type());
        model.addAttribute("typeCodes", TypeCode.type());
        return "admin/building/list";
    }

    @GetMapping(value = "/admin/building-edit")
    public String buildingEdit(@ModelAttribute BuildingDTO buildingDTO, Model model , HttpServletRequest request) {
        model.addAttribute("buildingEdit", buildingDTO);
        model.addAttribute("districts", District.type());
        model.addAttribute("typeCodes", TypeCode.type());
        return "admin/building/edit";
    }

    @GetMapping(value = "/admin/building-edit-{id}")
    public String buildingEdit(@PathVariable("id") Long id, Model model, HttpServletRequest request) {
        // Xuong DB tim building theo id
        BuildingDTO buildingDTO = buildingService.findBuildingById(id);

        model.addAttribute("buildingEdit", buildingDTO);
        model.addAttribute("districts", District.type());
        model.addAttribute("typeCodes", TypeCode.type());
        return "admin/building/edit";
    }
}

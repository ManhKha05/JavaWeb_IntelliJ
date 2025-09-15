package com.javaweb.controller.admin;



import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
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

    @GetMapping(value = "/admin/building-list")
    public String buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, Model model) {

        model.addAttribute("modelSearch", buildingSearchRequest);
        //Xuong DB lay data
        List<BuildingSearchResponse> responseList = new ArrayList<>();
        BuildingSearchResponse item1 = new BuildingSearchResponse();
        item1.setId(1L);
        item1.setName("HDM Building");
        item1.setAddress("128 Nguyễn Đức Cảnh, Tương Mai, Hà Nội");
        item1.setNumberOfBasement(1L);
        item1.setManagerName("Nguyễn Hoài An");
        item1.setManagerPhone("123456789");
        item1.setRentArea("100, 200, 300");

        BuildingSearchResponse item2 = new BuildingSearchResponse();
        item2.setId(4L);
        item2.setName("Top Tower");
        item2.setAddress("89 Hoàng Văn Thái, Định Công, Hà Nội");
        item2.setNumberOfBasement(2L);
        item2.setManagerName("Phạm Thị Nhung");
        item2.setManagerPhone("0382079152");
        item2.setRentArea("100, 300");

        responseList.add(item1);
        responseList.add(item2);
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
        BuildingDTO buildingDTO = new BuildingDTO();
        buildingDTO.setId(id);
        buildingDTO.setName("Second Building");
        buildingDTO.setWard("Tương Mai");
        buildingDTO.setStreet("Trương Định");
        buildingDTO.setDistrict("QUAN_HOANG_MAI");
        buildingDTO.setNumberOfBasement(3L);

        model.addAttribute("buildingEdit", buildingDTO);
        model.addAttribute("districts", District.type());
        model.addAttribute("typeCodes", TypeCode.type());
        return "admin/building/edit";
    }
}

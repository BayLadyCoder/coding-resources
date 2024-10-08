package com.baygrove.capstone.controller;

import com.baygrove.capstone.database.dao.ResourceDAO;
import com.baygrove.capstone.database.dao.ResourceListDAO;
import com.baygrove.capstone.database.dao.UserListDAO;
import com.baygrove.capstone.database.entity.*;
import com.baygrove.capstone.database.enums.ResourceStatus;
import com.baygrove.capstone.dto.ResourceDTO;
import com.baygrove.capstone.service.ResourceService;
import com.baygrove.capstone.service.UserService;
import com.baygrove.capstone.utils.resources.ResourceUtils;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Slf4j
@Controller
public class IndexController {
    @Autowired
    ResourceDAO resourceDAO;

    @Autowired
    UserListDAO userListDAO;

    @Autowired
    UserService userService;

    @Autowired
    ResourceUtils resourceUtils;

    @Autowired
    ResourceListDAO resourceListDAO;

    @GetMapping("/")
    public ModelAndView index(HttpSession session) {
        ModelAndView response = new ModelAndView("index");
//        List<Map<String, Object>> resources = resourceDAO.findAllWithIsAddedToUserList(userListId);
        // TODO: Fix this? resource's topics relationships are not included
        session.setAttribute("userListId", userService.getCurrentUserDefaultListId());

        List<ResourceDTO> resourceDTOs = resourceUtils.getAllResourceDTOs();

        response.addObject("resources", resourceDTOs);


        return response;
    }
}

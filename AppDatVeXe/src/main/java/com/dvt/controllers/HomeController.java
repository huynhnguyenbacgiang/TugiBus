/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dvt.controllers;

import com.dvt.service.ILineService;
import com.dvt.service.IPointService;
import com.dvt.service.ITripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 *
 * @author VanTu
 */
@Controller
public class HomeController {
    @Autowired
    IPointService pointService;
    @Autowired
    ITripService tripService;
    @Autowired
    ILineService lineService;

    @ModelAttribute
    public void commonAttrs(Model model, HttpSession session) {
        model.addAttribute("points", pointService.getAll());
        model.addAttribute("poline", lineService.getPopularLine());
    }

    @RequestMapping("/")
    public String index(Model model) {
        return "index";
    }

    @RequestMapping("/tikcets")
    public String ticket(Model model) {
        return "ticket";
    }

    @RequestMapping("/paymemt")
    public String payment(Model model) {
        return "payment";
    }

}

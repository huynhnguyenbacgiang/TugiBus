package com.dvt.controllers;

import com.dvt.pojos.Trip;
import com.dvt.service.ITripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TripController {
    @Autowired
    ITripService tripService;

    @GetMapping("/line/{lineId}/trips")
    public String searchTrips(Model model, @PathVariable(value = "lineId") Integer lineId){
        model.addAttribute("trips", tripService.getTrips(lineId));

        return "trips";
    }


    @RequestMapping("/trip")
    public String searchTrips(Model model
            , @RequestParam(value = "sPoint", required = false) int sPointId
            , @RequestParam(value = "ePoint", required = false) int ePointId
            , @RequestParam(value = "sDate", required = false) String sDate){

        System.out.println("controller: " + sDate);
        System.out.println(tripService.getTrip(sPointId, ePointId, sDate));

        if (sPointId != 0 && ePointId != 0 && sDate != null) {
            Trip trip = tripService.getTrip(sPointId, ePointId, sDate);
            model.addAttribute("trip", trip);
            if (trip != null)
                return "redirect:/trip/" + trip.getId() + "/book-ticket";
            else
                model.addAttribute("mgsSearchtrip", false);
        }

        return "redirect:/";
    }
}

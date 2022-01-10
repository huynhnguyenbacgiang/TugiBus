package com.dvt.controllers;

import com.dvt.pojos.Ticket;
import com.dvt.pojos.TicketDetail;
import com.dvt.pojos.Trip;
import com.dvt.pojos.User;
import com.dvt.service.ITicketService;
import com.dvt.service.ITripService;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TicketController {
    @Autowired
    IUserService userService;
    @Autowired
    ITripService tripService;
    @Autowired
    ITicketService ticketService;

    @GetMapping("/book-ticket")
    public String showTicket(Model model, HttpSession session) {
        Trip trip = (Trip) session.getAttribute("trip");
        if (trip != null) {
            return "forward:/trip/" + trip.getId() + "/book-ticket";
        }

        return "ticket";
    }

    @GetMapping("/trip/{tripId}/book-ticket")
    public String showTicketByTrip(Model model, @PathVariable(value = "tripId") int tripId
            , HttpSession session, Principal principal) {
        Trip trip = tripService.getTripById(tripId);

        if (trip != null) {
            session.setAttribute("trip", trip);
            model.addAttribute("trip", trip);
            model.addAttribute("seats", tripService.getSeatsByTrip(trip));
            if (principal != null) {
                User u = userService.getUserByUsername(principal.getName());
                if (u != null)
                    model.addAttribute("user", u);
            }
        }
        return "ticket";
    }

    @GetMapping("/trip/{tripId}/book-ticket/{seat}")
    public String bookTicket(Model model
            , @PathVariable(value = "tripId") int tripId
            , @PathVariable(value = "seat") int seat) {
        Trip trip = tripService.getTripById(tripId);

        return "";
    }

    @GetMapping(value = {"/{ticketId}/ticketdetail", "/{ticketId}/ticketdetail/{result}"})
    public String showDetailTicket(Model model
            , @PathVariable(value = "ticketId") int ticketId
            , @PathVariable(value = "result", required = false) String result){
        TicketDetail ticketDetail = ticketService.getTicketsDeTailByTicktetId(ticketId);
        model.addAttribute("mgs", result);
        model.addAttribute("ticketDetail", ticketDetail);
        return "ticketdetail";
    }
}

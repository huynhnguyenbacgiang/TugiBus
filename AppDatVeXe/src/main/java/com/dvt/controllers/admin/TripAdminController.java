package com.dvt.controllers.admin;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dvt.pojos.*;
import com.dvt.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/trips")
public class TripAdminController {
    @Autowired
    ITripService tripService;
    @Autowired
    ILineService lineService;
    @Autowired
    IUserService userService;

    @GetMapping(value = {"", "/{result}"})
    public String showTrip(Model model
            , @PathVariable(value = "result", required = false) String result) {
        model.addAttribute("trips", tripService.getAll());
        model.addAttribute("lines", lineService.getAll());
        model.addAttribute("drivers", userService.getUsersByRole("ROLE_DRIVER"));

        if(result != null)
            model.addAttribute("mgs", MgsUtil.mgsShow("chuyến xe", result));

        return "tripsAdmin";
    }

    @PostMapping("/add")
    public String createTrip(@RequestParam(value = "tripLine") int tripLine
            , @RequestParam(value = "startTrip") String startTrip
            , @RequestParam(value = "endTrip") String endTrip
            , @RequestParam(value = "tripDriver") int tripDriver
            , @RequestParam(value = "extraChanges") BigDecimal extraChanges) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String formatSTrip = startTrip.replace("T", " ");
        String formatETrip = endTrip.replace("T", " ");
        String status = "addSus";

        try {
            Date sTrip = formatter.parse(formatETrip);
            Date eTrip = formatter.parse(formatSTrip);
            Line line = lineService.getLineById(tripLine);
            User driver = userService.getUserById(tripDriver);
            tripService.save(new Trip(sTrip, eTrip, driver.getVehicles().get(0).getSeat()
                    , extraChanges, driver, line));
        } catch (ParseException e) {
            status = "err";
            System.err.println("----Them chuyen xe loi---");
            e.printStackTrace();
        }

        return "redirect:/admin/trips/" + status;
    }

    @PostMapping("/update")
    public String updateTrip(Model model
            , @RequestParam(value = "tripId") int tripId
            , @RequestParam(value = "tripDriver") int tripDriver
            , @RequestParam(value = "extraChanges") BigDecimal extraChanges) {
        String status = "updateSus";

        try {
            Trip trip = tripService.getTripById(tripId);
            trip.setDriver(userService.getUserById(tripDriver));
            trip.setExtra_changes(extraChanges);
            tripService.update(trip);
        } catch (Exception e) {
            status = "err";
            System.err.println("----Cap nhat chuyen xe loi------");
            e.printStackTrace();
        }

        return "redirect:/admin/trips/" + status;
    }

    @RequestMapping("/{tripId}/delete")
    public String deleteTrip(@PathVariable(value = "tripId") Integer tripId) {
        String status = "deleteSus";

        try {
            Trip trip = tripService.getTripById(tripId);
            tripService.delete(trip);
        } catch (Exception e) {
            status = "err";
            System.err.println("----Xoa chuyen xe loi------");
            e.printStackTrace();
        }

        return "redirect:/admin/trips/" + status;
    }
}

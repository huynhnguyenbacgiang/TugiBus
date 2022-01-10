package com.dvt.controllers.admin;

import com.cloudinary.utils.ObjectUtils;
import com.dvt.pojos.*;
import com.dvt.service.IUserService;
import com.dvt.service.IVehicleService;
import com.dvt.service.IVehicleTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/vehicles")
public class VehicleAdminController {
    @Autowired
    IVehicleService vehicleService;
    @Autowired
    IVehicleTypeService vehicleTypeService;
    @Autowired
    IUserService userService;

    @GetMapping(value = {"", "/{result}"})
    public String showTrip(Model model
            , @PathVariable(value = "result", required = false) String result) {
        model.addAttribute("vehicles", vehicleService.getAll());
        model.addAttribute("vehicleTypes", vehicleTypeService.getAll());
        model.addAttribute("drivers", userService.getDrivers());

        if(result != null)
            model.addAttribute("mgs", MgsUtil.mgsShow("xe", result));

        return "vehiclesAdmin";
    }

    @PostMapping("/add")
    public String createTrip(@RequestParam(value = "licensePlate") String licensePlate
            , @RequestParam(value = "vehicleType") int vehicleTypeId
            , @RequestParam(value = "extraChanges") BigDecimal extraChanges
            , @RequestParam(value = "driver") int driverId) {
        String status = "addSus";
        VehicleType vt = vehicleTypeService.getById(vehicleTypeId);
        User u = userService.getById(driverId);

        try {
            vehicleService.save(new Vehicle(licensePlate, vt.getSeat()
                    , extraChanges, u, vt));
        } catch (Exception e) {
            status = "err";
            System.err.println("----Them xe loi---");
            e.printStackTrace();
        }

        return "redirect:/admin/vehicles/" + status;
    }

    @PostMapping("/update")
    public String updatePlace(@RequestParam(value = "vehicleId") int vehicleId
            ,@RequestParam(value = "extraChangesUp") BigDecimal extraChanges
            ,@RequestParam(value = "driverUp") int driverId) {
        String status = "updateSus";
        Vehicle v = vehicleService.getById(vehicleId);

        try {
            if (v.getDriver().getId() != driverId)
                v.setDriver(userService.getById(driverId));
            v.setExtraChanges(extraChanges);
            vehicleService.update(v);
        } catch (Exception e) {
            status = "err";
            System.err.println("----Cap nhat xe loi---");
            e.printStackTrace();
        }

        return "redirect:/admin/vehicles/" + status;
    }

    @RequestMapping("/{vehicleId}/delete")
    public String deletePlace(@PathVariable(value = "vehicleId") Integer vehicleId) {
        String status = "deleteSus";
        Vehicle v = vehicleService.getById(vehicleId);

        if (v.getDriver() != null) {
            status = "err";
            System.out.println("----Xe nay dang co tai xe chay----");
            return "redirect:/admin/vehicles/" + status;
        }
        vehicleService.delete(v);

        return "redirect:/admin/vehicles/" + status;
    }
}

package com.dvt.controllers.admin;

import com.dvt.pojos.User;
import com.dvt.service.IPermissionService;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.security.Principal;


@Controller
@RequestMapping("/admin/users")
public class UserAdminController {
    @Autowired
    IUserService userService;
    @Autowired
    IPermissionService permissionService;

    @GetMapping(value = {"", "/{result}"})
    public String showTrip(Model model, Principal principal
            , @PathVariable(value = "result", required = false) String result) {
        if(result != null)
            model.addAttribute("mgs", MgsUtil.mgsShow("người dùng", result));

        model.addAttribute("users", userService.getAnotherUsers(principal.getName()));
        model.addAttribute("permissions", permissionService.getAll());

        return "usersAdmin";
    }

    @PostMapping("/update")
    public String updatePlace(@RequestParam(value = "userId") int userId
            ,@RequestParam(value = "addressUp") String address
            ,@RequestParam(value = "phoneNumberUp") String phoneNumberUp
            ,@RequestParam(value = "permissionId") String permissionId) {
        String status = "updateSus";

        try {
            User u = userService.getById(userId);

            if (u.getPermission().getId().equals(permissionId))
                u.setPermission(permissionService.getPerById(permissionId));
            u.setAddress(address);
            u.setNumberPhone(phoneNumberUp);

            userService.update(u);
        } catch (Exception e) {
            status = "err";
            System.err.println("----Cap nhat nguoi dung loi---");
            e.printStackTrace();
        }

        return "redirect:/admin/users/" + status;
    }

    @RequestMapping("/{userId}/delete")
    public String deletePlace(@PathVariable(value = "userId") int userId) {
        String status = "deleteSus";
        User u = userService.getById(userId);

        if (u.getVehicles().size() > 0 || u.getTickets().size() > 0) {
            status = "err";
            System.err.println("----Xoa nguoi dung that bai---");
            System.err.println("----Nguoi dung nay da dat ve Hoac nguoi dung nay la tai xe va dang hoat dong---");
            //con truong hop nay
            System.err.println("----Nguoi dung dang login---");
        } else {
            userService.delete(u);
        }

        return "redirect:/admin/users/" + status;
    }
}

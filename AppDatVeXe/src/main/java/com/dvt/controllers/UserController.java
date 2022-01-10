package com.dvt.controllers;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dvt.pojos.Permission;
import com.dvt.pojos.User;
import com.dvt.service.IPermissionService;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    IUserService userDetailsService;
    @Autowired
    IUserService userService;
    @Autowired
    IPermissionService permissionService;
    @Autowired
    Cloudinary cloudinary;

    @GetMapping("/signup")
    public String signupForm() {
        return "signup";
    }

    @PostMapping(value = "/signup")
    public String signup(Model model
            , @RequestParam(value = "lastName") String lastName
            , @RequestParam(value = "firstName") String firstName
            , @RequestParam(value = "username") String username
            , @RequestParam(value = "phone") String phone
            , @RequestParam(value = "password") String password
            , @RequestParam(value = "password2") String password2
            , @RequestParam(value = "avatar") MultipartFile avatar) {
        String mgs = "";

        String uAvatar = "";
        try {
            Map imgCloud = this.cloudinary.uploader()
                    .upload(avatar.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
            uAvatar = (String) imgCloud.get("secure_url");
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("Chọn ảnh đại diện thất bại", mgs);
            return "signup";
        }
        System.out.println(uAvatar);
        if (password.equals(password2)) {
            Permission permission = permissionService.getPerById("ROLE_CUSTOMER");
            if (userDetailsService.createUser(new User(username, password, firstName
                    , lastName, phone, permission))) {
                    userService.updateAvatar(username, uAvatar);
                    return "redirect:/signin";
                } else {
                mgs = "Username đã tồn tại!!";
                }
        } else {
            mgs = "Mật khẩu không khớp";
        }

        model.addAttribute("mgs", mgs);
        return "signup";
    }

//    @RequestMapping(value = "/new-info", method = RequestMethod.POST)
//    public String updateProfile(Model model) {
//        System.out.println("test update");
//
//        return "profile";
//    }

    @PostMapping("/profile")
    public String updateProfile(Model model
        ,@RequestParam(value = "userName") String userName
        ,@RequestParam(value = "email") String email
        ,@RequestParam(value = "phone") String phone
        ,@RequestParam(value = "address") String address) {
        String mgs = "";
        System.out.println(userName + "-------------" + email + "-------------" + phone + "-------------" + address);

        User user = userService.getUserByUsername(userName);
        user.setEmail(email);
        user.setNumberPhone(phone);
        user.setAddress(address);
        if(userService.updateUser(user)){
            mgs = "sus";
    //            model.addAttribute("rel", mgs);
    //            System.out.println(mgs);
    //            return "redirect:/profile";
        }else {
            mgs ="err";
        }
        System.out.println(mgs);

        return "redirect:/profile/" + mgs;
    }

    @PostMapping("/password")
    public String updatePass(Model model,Principal principal
        ,@RequestParam(value = "newpass") String newPass
        ,@RequestParam(value = "oldpass") String oldPass){
        String mgs = "";
        User user = userService.getUserByUsername(principal.getName());
        System.out.println("user.getPassword()       " + user.getPassword());
        System.out.println("oldPass                   " + oldPass);
        System.out.println("userService.enCode(oldPass)      " + userService.enCode(oldPass));
        System.out.println("userService.enCode(oldPass)      " + userService.enCode(oldPass));
        if (user.getPassword().equals(userService.enCode(oldPass))){
            String enPass = userService.enCode(newPass);
            user.setPassword(enPass);
            if(userService.updateUser(user)){
                mgs = "sus";
            }else{
                mgs = "err";
            }
        }
        else {
            mgs = "err2";
        }

        System.out.println(mgs);
        model.addAttribute("result", mgs);
        return "/profile";
    }

    @PostMapping("/update-avatar")
    public String updateAvatar(@RequestParam(value = "img") MultipartFile image, Principal principal) {
        String mgs = "";
        try {
            Map imgCloud = this.cloudinary.uploader()
                    .upload(image.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
            String avatar = (String) imgCloud.get("secure_url");
            userService.updateAvatar(principal.getName(), avatar);
            mgs = "sus";
        } catch (IOException e) {
            e.printStackTrace();
            mgs = "err";
        }

        return "redirect:/profile/" + mgs;
    }

    @RequestMapping("/signin")
    public String signin(Model model) {
        return "signin";
    }


    @GetMapping(value = {"/profile", "/profile/{result}"})
    public String searchUser(Model model, @PathVariable(value = "result", required = false) String result, Principal principal){
        model.addAttribute("user", userService.getUserByUsername(principal.getName()));
        model.addAttribute("ticket", userService.getTicketByUsername(principal.getName()));
        return "profile";
    }


}

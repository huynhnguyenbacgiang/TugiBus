package com.dvt.controllers.admin;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dvt.pojos.Line;
import com.dvt.pojos.Point;
import com.dvt.service.ILineService;
import com.dvt.service.IPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/points")
public class PointAdminController {
    @Autowired
    Cloudinary cloudinary;
    @Autowired
    IPointService pointService;
    @Autowired
    ILineService lineService;

    @GetMapping(value = {"", "/{result}"})
    public String showPoint(Model model
            , @PathVariable(value = "result", required = false) String result) {

        if (result != null) {
            model.addAttribute("mgs", MgsUtil.mgsShow("địa điểm",result));
        }

        model.addAttribute("points", pointService.getAll());
        return "pointsAdmin";
    }

    @PostMapping("/add")
    public String createPlace(Model model
            , @RequestParam(value = "placeName") String placeName
            , @RequestParam(value = "placePicture") MultipartFile placePicture) {
        String status = "addSus";
        String placeImage = "";

        try {
            Map imgCloud = this.cloudinary.uploader()
                    .upload(placePicture.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
            placeImage = (String) imgCloud.get("secure_url");
        } catch (IOException e) {
            status = "err";
            e.printStackTrace();
        }

        pointService.save(new Point(placeName, placeImage));
        return "redirect:/admin/points/" + status;
    }

    @PostMapping("/update")
    public String updatePlace(Model model
            ,@RequestParam(value = "placePictureUpdate") MultipartFile placePicture
            , @RequestParam(value = "placeId") int placeId) {
        String status = "updateSus";
        String placeImage = "";

        if (placePicture.getSize() <= 0) {
            status = "err";
        } else {
            try {
                Map imgCloud = this.cloudinary.uploader()
                        .upload(placePicture.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                placeImage = (String) imgCloud.get("secure_url");
            } catch (IOException e) {
                status = "err";
                e.printStackTrace();
            }
        }
        Point p = pointService.getPointById(placeId);
        p.setPicture(placeImage);
        pointService.update(p);

        return "redirect:/admin/points/" + status;
    }

    @RequestMapping("/{placeId}/delete")
    public String deletePlace(Model model
            , @PathVariable(value = "placeId") Integer placeId) {
        String status = "deleteSus";

        try {
            List<Line> ls = lineService.getLinesBySPoint(placeId);

            if (ls.size() > 0) {
                status = "err";
            } else {
                Point p = pointService.getPointById(placeId);
                pointService.delete(p);
            }
        } catch (Exception e) {
            status = "err";
        }

        return "redirect:/admin/points/" + status;
    }
}

package com.dvt.controllers.admin;

import com.dvt.pojos.Line;
import com.dvt.pojos.Point;
import com.dvt.service.ILineService;
import com.dvt.service.IPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/admin/lines")
public class LineAdminController {
    @Autowired
    ILineService lineService;
    @Autowired
    IPointService pointService;

    @GetMapping(value = {"", "/{result}"})
    public String showLine(Model model
            , @PathVariable(value = "result", required = false) String result) {
        model.addAttribute("lines", lineService.getAll());
        model.addAttribute("points", pointService.getAll());

        if(result != null)
            model.addAttribute("mgs", MgsUtil.mgsShow("tuyến xe", result));

        return "linesAdmin";
    }

    @PostMapping("/add")
    public String createLine(@RequestParam(value = "startPlace") int startPlaceId
            , @RequestParam(value = "endPlace") int endPlaceId
            , @RequestParam(value = "price") BigDecimal price
            , @RequestParam(value = "distance") int distance
            , @RequestParam(value = "time") int time) {
        String status = "addSus";

        if (startPlaceId == endPlaceId) {
            status = "err";
            System.err.println("----Tuyen co diem di va den trung nhau---");
            return "redirect:/admin/lines/" + status;
        }
        try {
            List<Line> lines = lineService.getAll();
            for (Line l : lines) {
                if (startPlaceId == l.getStartPoint().getId()
                        && endPlaceId == l.getEndPoint().getId()) {
                    status = "err";
                    System.err.println("----Tuyen nay da co----");
                    return "redirect:/admin/lines/" + status;
                }
            }
            lineService.createLine(new Line(pointService.getPointById(startPlaceId)
                    , pointService.getPointById(endPlaceId), price, distance, time));
        } catch (Exception e) {
            status = "err";
            System.err.println("----Them tuyen loi------");
            e.printStackTrace();
        }
        return "redirect:/admin/lines/" + status;
    }

    @PostMapping("/update")
    public String updateLine(@RequestParam(value = "idline") int lineId
            , @RequestParam(value = "price") BigDecimal price
            , @RequestParam(value = "distance") int distance
            , @RequestParam(value = "time") int time) {
        String status = "updateSus";

        try {
            Line l = lineService.getLineById(lineId);
            l.setPrice(price);
            l.setKilometer(distance);
            l.setTime(time);
            lineService.update(l);
        } catch (Exception e) {
            status = "err";
            System.err.println("----Cap nhat tuyen loi------");
            e.printStackTrace();
        }

        return "redirect:/admin/lines/" + status;
    }

    @RequestMapping("/{lineId}/delete")
    public String deleteLine(@PathVariable(value = "lineId") Integer lineId) {
        String status = "deleteSus";

        try {
            Line line = lineService.getLineById(lineId);
            if (line.getTrips().size() > 0) {
                status = "err";
                return "redirect:/admin/lines/" + status;
            }
            lineService.deleteLine(line);
        } catch (Exception e) {
            status = "err";
            System.err.println("----Xoa tuyen loi------");
            e.printStackTrace();
        }

        return "redirect:/admin/lines/" + status;
    }
}

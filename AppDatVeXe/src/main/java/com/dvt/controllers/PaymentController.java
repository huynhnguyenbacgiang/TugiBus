package com.dvt.controllers;

import com.dvt.pojos.Booking;
import com.dvt.pojos.Ticket;
import com.dvt.service.ITicketService;
import com.mservice.allinone.models.CaptureMoMoResponse;
import com.mservice.allinone.processor.allinone.CaptureMoMo;
import com.mservice.shared.sharedmodels.Environment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/pay")
public class PaymentController {
    @Autowired
    Environment environment;
    @Autowired
    ITicketService ticketService;

    @RequestMapping("/momo")
    public String paymomo(Model model, @RequestParam(value = "trip") int tripId
            , @RequestParam(value = "price") BigDecimal price
            , @RequestParam(value = "seatPosition") int seatPosition
            , @RequestParam(value = "userId") int userId
            , HttpServletRequest request) {

        String requestId = request.getSession().getId();
        Booking b = new Booking(UUID.randomUUID().toString(), tripId, price, seatPosition, userId);
        System.out.println("Booking b: " + b);
        Object ticketList = request.getSession().getAttribute("bookingList");
        List<Booking> bookingList = ticketList != null ? (List<Booking>) ticketList : new ArrayList<>();
        bookingList.add(b);
        request.getSession().setAttribute("bookingList", bookingList);
        System.out.println("bookingList: " + bookingList);

        String orderInfo = b.getUserId() + " Payment"; //làm thêm '+ tên trip'
        String returnURL = "http://localhost:8080/AppDatVeXe/pay/momo/result";
        String notifyURL = "http://localhost:8080/AppDatVeXe/momo/result";
        String extraData = "";
        String bankCode = "SML";

        CaptureMoMoResponse captureMoMoResponse;
        try {
            captureMoMoResponse = CaptureMoMo.process(environment, b.getOderId(), requestId, b.getPrice().toString()
                    , orderInfo, returnURL, notifyURL, "");
            model.addAttribute("urlpayment", captureMoMoResponse.getPayUrl());
            return "payment";
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        model.addAttribute("mgs", "Lỗi cổng thanh toán");
        return "payment";
    }

    @RequestMapping("/momo/result")
    public String checkPayMent(Model model
            ,@RequestParam("accessKey") String accessKey
            ,@RequestParam("partnerCode") String partnerCode
            ,@RequestParam("requestId") String requestId
            ,@RequestParam("orderId") String orderId
            ,@RequestParam("transId") String transId
            ,@RequestParam("message") String message
            ,@RequestParam("localMessage") String localMessage
            ,@RequestParam(value = "errorCode",required = false) String errorCode
            , HttpServletRequest request){
        System.err.println("=====Thông tin thanh toán trả về==");
        System.err.println(accessKey);
        System.err.println(partnerCode);
        System.err.println(requestId);
        System.err.println(orderId);
        System.err.println(transId);
        System.err.println(localMessage);
        System.err.println(errorCode);
        if (ticketService.addTicket(request.getSession(), transId, orderId)) {
            int ticketId = ticketService.getTicketIdbyTranId(transId);
            return "redirect:/" + ticketId + "/ticketdetail/" + message;
        }
        return "redirect:/book-ticket";
    }
}

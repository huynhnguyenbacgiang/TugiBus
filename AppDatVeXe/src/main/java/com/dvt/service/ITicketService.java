package com.dvt.service;

import com.dvt.pojos.Ticket;
import com.dvt.pojos.TicketDetail;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ITicketService extends IGenericsServevice<Ticket>{
    public List<Ticket> getTicketsByTrip(int tripId);
    public boolean addTicket(HttpSession session, String transId, String orderId);
    public TicketDetail getTicketsDeTailByTicktetId(int ticketId);
    public int getTicketIdbyTranId(String transId);
}

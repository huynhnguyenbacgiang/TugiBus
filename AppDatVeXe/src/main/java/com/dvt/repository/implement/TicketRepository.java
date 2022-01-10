package com.dvt.repository.implement;

import com.dvt.pojos.*;
import com.dvt.repository.ITicketRepository;
import com.dvt.repository.ITripRepository;
import com.dvt.repository.IUserRepository;
import com.dvt.service.ITripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Repository
@Transactional
public class TicketRepository extends GenericsRepository<Ticket> implements ITicketRepository {
    @Autowired
    ITripRepository tripRepository;
    @Autowired
    IUserRepository userRepository;


    @Override
    public List<Ticket> getTicketsByTrip(int tripId) {
        if (tripId > 0) {
            String hql = "from Trip where id = :id";
            Trip t = (Trip) getCurrentSession().createQuery(hql)
                    .setParameter("id", tripId).getSingleResult();
            if (t != null)
                return t.getTickets();
        }
        return null;
    }
    @Override
    public TicketDetail getTicketsDeTailByTicktetId(int ticketId){
        if (ticketId > 0) {
            String hql = "from TicketDetail where ticket.id = :id";
            TicketDetail t = (TicketDetail) getCurrentSession().createQuery(hql)
                    .setParameter("id", ticketId).getSingleResult();
            if (t != null)
                return t;
        }
        return null;
    }

    @Override
    public int getTicketIdbyTranId(String transId) {
        TicketDetail td = (TicketDetail) getCurrentSession()
                .createQuery("from TicketDetail where transId = :id")
                .setParameter("id", transId).getSingleResult();
        return td.getTicket().getId();
    }

    @Override
    public boolean addTicket(HttpSession session, String transId, String orderId) {
        List<Booking> bookingList = (List<Booking>) session.getAttribute("bookingList");

        Booking booking = bookingList.stream().filter(b -> b.getOderId().equals(orderId))
                .findFirst().get();

        if (booking != null) {
            User user = userRepository.getUserById(booking.getUserId());
            Trip trip = tripRepository.getTripById(booking.getTripId());
            Ticket ticket = new Ticket(new Date(), user, trip);
            save(ticket);
            System.out.println("ticket: " + ticket.getId());
            TicketDetail ticketDetail = new TicketDetail(booking.getSeatPosition()
                    , "Lưu ý: Vui lòng đến có mặt trước giờ khỏi hành 15'"
                    , booking.getPrice(), transId, ticket, trip.getDriver().getVehicles().get(0));
            getCurrentSession().save(ticketDetail);
            return true;
        }

        return true;
    }


}

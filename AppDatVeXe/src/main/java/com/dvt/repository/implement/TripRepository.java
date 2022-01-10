package com.dvt.repository.implement;

import com.dvt.pojos.Line;
import com.dvt.pojos.Ticket;
import com.dvt.pojos.Trip;
import com.dvt.repository.ITripRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import javax.persistence.NoResultException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Repository
@Transactional
public class TripRepository extends GenericsRepository<Trip> implements ITripRepository {

    @Override
    public Trip getTripById(int id) {
//        if (id > 0) {
//            String hql = "from Trip where id = :id";
//            return (Trip) getCurrentSession().createQuery(hql)
//                    .setParameter("id", id).getSingleResult();
//        }
//        return null;
        return getCurrentSession().get(Trip.class, id);
    }

    @Override
    public List<Trip> getTrips(int lineId) {
        Line l = null;
        if (lineId > 0) {
            String hql = "from Line where id = :id";
            l = (Line) getCurrentSession().createQuery(hql)
                    .setParameter("id", lineId).getSingleResult();
        }
        return l.getTrips();
    }

    @Override
    public Trip getTrip(int sPointId, int ePointId, String sDate) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date sd = formatter.parse(sDate);
            Date ed = (Date) sd.clone();
            ed.setTime(ed.getTime() + 86400000);

            if (sPointId != 0 && ePointId != 0) {
                String hql1 = "from Trip where line.startPoint.id = :idSPoint and line.endPoint.id = :idEPoint and startTime between :sTime and :eTime";
                try {
                    Trip trip = (Trip) getCurrentSession().createQuery(hql1)
                            .setParameter("idSPoint", sPointId)
                            .setParameter("idEPoint", ePointId)
                            .setParameter("sTime", sd)
                            .setParameter("eTime", ed)
                            .getSingleResult();
                    System.out.println("getTrip(int sPointId, int ePointId, String sDate): " + trip);
                    return trip;
                } catch (NoResultException ex) {
                    ex.printStackTrace();
                }
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Map<Integer, Boolean> getSeatsByTrip(Trip trip) {
        Map<Integer, Boolean> seats = new HashMap<>();
        List<Ticket> tickets = trip.getTickets();
        System.out.println("tickets =      "+tickets);
        int seatsAmount = trip.getDriver().getVehicles().get(0).getSeat();

        for (int i = 1; i <= seatsAmount; i++) {
            seats.put(i, false);
        }
        if (tickets != null) {
            for (Ticket t : tickets) {
                System.out.println("ticketdetail           :" + t.getTicketDetails().get(0).getSeatPosition());
                seats.put(t.getTicketDetails().get(0).getSeatPosition(), true);
            }
        }

        return seats;
    }
}

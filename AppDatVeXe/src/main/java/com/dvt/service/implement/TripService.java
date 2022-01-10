package com.dvt.service.implement;

import com.dvt.pojos.Trip;
import com.dvt.repository.ITripRepository;
import com.dvt.service.ITripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class TripService extends GenericsService<Trip> implements ITripService {
    @Autowired
    ITripRepository tripRepository;

    @Override
    public Trip getTripById(int id) {
        return tripRepository.getTripById(id);
    }

    @Override
    public List<Trip> getTrips(int lineId) {
        return tripRepository.getTrips(lineId);
    }

    @Override
    public Trip getTrip(int sPointId, int ePointId, String sDate) {
        return tripRepository.getTrip(sPointId, ePointId, sDate);
    }

    @Override
    public Map<Integer, Boolean> getSeatsByTrip(Trip trip) {
        return tripRepository.getSeatsByTrip(trip);
    }
    @Override
    public List<Trip> getAllTripp(){
        return tripRepository.getAll();
    }
}

package com.dvt.service.implement;

import com.dvt.pojos.Vehicle;
import com.dvt.service.IVehicleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class VehicleService extends GenericsService<Vehicle> implements IVehicleService {
}

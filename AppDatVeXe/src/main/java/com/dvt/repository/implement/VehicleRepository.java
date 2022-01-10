package com.dvt.repository.implement;

import com.dvt.pojos.Vehicle;
import com.dvt.repository.IVehicleRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class VehicleRepository extends GenericsRepository<Vehicle> implements IVehicleRepository {

}

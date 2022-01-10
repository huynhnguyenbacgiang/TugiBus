package com.dvt.repository.implement;

import com.dvt.pojos.VehicleType;
import com.dvt.repository.IVehicleTypeRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class VehicleTypeRepository extends GenericsRepository<VehicleType> implements IVehicleTypeRepository {
}

package com.dvt.service.implement;

import com.dvt.pojos.VehicleType;
import com.dvt.service.IVehicleTypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class VehicleTypeService extends GenericsService<VehicleType> implements IVehicleTypeService {
}

package com.dvt.service.implement;

import com.dvt.pojos.Point;
import com.dvt.repository.IPointRepository;
import com.dvt.service.IPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PointService extends GenericsService<Point> implements IPointService {
    @Autowired
    IPointRepository pointRepository;


    @Override
    public List<Point> getAllPoint(){return pointRepository.getAll();}

    @Override
    public Point getPointById(int id){return pointRepository.getPointById(id);}
}

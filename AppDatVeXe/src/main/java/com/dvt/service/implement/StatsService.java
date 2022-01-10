package com.dvt.service.implement;

import com.dvt.repository.IStatsRepository;
import com.dvt.service.IStatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StatsService implements IStatsService {
    @Autowired
    IStatsRepository statsRepository;

    @Override
    public List<Object[]> lineStats() {
        return statsRepository.lineStats();
    }

    @Override
    public List<Object[]> tripStats() {
        return statsRepository.tripStats();
    }

    @Override
    public List<Object[]> monthStats(int year) {
        return statsRepository.monthStats(year);
    }

    @Override
    public List<Object[]> yearStats() {
        return statsRepository.yearStats();
    }

}

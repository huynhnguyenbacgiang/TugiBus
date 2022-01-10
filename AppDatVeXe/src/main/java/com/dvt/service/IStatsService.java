package com.dvt.service;

import java.util.List;

public interface IStatsService {
    public List<Object[]> lineStats();
    public List<Object[]> tripStats();
    public List<Object[]> monthStats(int year);
    public List<Object[]> yearStats();
}

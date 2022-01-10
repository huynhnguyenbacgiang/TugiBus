package com.dvt.repository;

import java.util.List;

public interface IStatsRepository {
    public List<Object[]> lineStats();
    public List<Object[]> tripStats();
    public List<Object[]> monthStats(int year);
    public List<Object[]> yearStats();
}

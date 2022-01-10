package com.dvt.repository;

import java.util.List;

public interface IGenericsRepository<T> {
    List<T> getAll();
    T getById(int id);
    void save(T obj);
    void update(T obj);
    void saveOrUpdate(T obj);
    void delete(T obj);
}

package com.dvt.service.implement;

import com.dvt.repository.IGenericsRepository;
import com.dvt.service.IGenericsServevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GenericsService<T> implements IGenericsServevice<T> {
    @Autowired
    IGenericsRepository<T> genericsRepository;

    @Override
    public List<T> getAll() {
        return genericsRepository.getAll();
    }

    @Override
    public T getById(int id) {
        return genericsRepository.getById(id);
    }

    @Override
    public void save(T obj) {
        genericsRepository.save(obj);
    }

    @Override
    public void update(T obj) {
        genericsRepository.update(obj);
    }

    @Override
    public void saveOrUpdate(T obj) {
        genericsRepository.saveOrUpdate(obj);
    }

    @Override
    public void delete(T obj) {
        genericsRepository.delete(obj);
    }
}

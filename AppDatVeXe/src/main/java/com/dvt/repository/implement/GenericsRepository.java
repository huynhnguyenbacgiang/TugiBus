package com.dvt.repository.implement;

import com.dvt.pojos.Trip;
import com.dvt.repository.IGenericsRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

@Repository
@Transactional
public class GenericsRepository<T> implements IGenericsRepository<T> {
    @Autowired
    LocalSessionFactoryBean sessionFactory;

    protected Session getCurrentSession() {
        return sessionFactory.getObject().getCurrentSession();
    }

    protected Class getClassType() {
        Type t = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) t;
        return (Class) pt.getActualTypeArguments()[0];
    }

    @Override
    public List<T> getAll() {
        return getCurrentSession().createQuery("from " + getClassType().getSimpleName()).getResultList();
    }

    @Override
    public T getById(int id) {
        return (T) getCurrentSession().get(getClassType(), id);
    }

    @Override
    public void save(T obj) {
        if (obj != null) {
            getCurrentSession().save(obj);
        }
    }

    @Override
    public void update(T obj) {
        if (obj != null) {
            getCurrentSession().update(obj);
        }
    }

    @Override
    public void saveOrUpdate(T obj) {
        if (obj != null) {
            getCurrentSession().update(obj);
        }
    }

    @Override
    public void delete(T obj) {
        if (obj != null) {
            getCurrentSession().delete(obj);
        }
    }
}

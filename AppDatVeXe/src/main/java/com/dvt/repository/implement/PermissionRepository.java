package com.dvt.repository.implement;

import com.dvt.pojos.Permission;
import com.dvt.repository.IPermissionRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;

@Repository
@Transactional
public class PermissionRepository extends GenericsRepository<Permission> implements IPermissionRepository {

    @Override
    public Permission getPerByName(String perName) {
        Permission permission = null;
        try {
            permission = (Permission) getCurrentSession().createQuery("from Permission where name = :name")
                    .setParameter("name", perName).getSingleResult();
        } catch (NoResultException ex) {
            ex.printStackTrace();
        }
        return permission;
    }
    @Override
    public Permission getPerById(String perId){
        Permission permission = null;
        try {
            permission = (Permission) getCurrentSession().createQuery("from Permission where id = :id")
                    .setParameter("id", perId).getSingleResult();
        } catch (NoResultException ex) {
            ex.printStackTrace();
        }
        return permission;
    }
}

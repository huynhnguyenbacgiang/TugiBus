package com.dvt.repository.implement;

import com.dvt.pojos.Permission;
import com.dvt.pojos.Ticket;
import com.dvt.pojos.Trip;
import com.dvt.pojos.User;
import com.dvt.repository.IPermissionRepository;
import com.dvt.repository.ITicketRepository;
import com.dvt.repository.IUserRepository;
import com.dvt.service.IPointService;
import org.hibernate.HibernateError;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository
@Transactional
public class UserRepository extends GenericsRepository<User> implements IUserRepository {
    @Autowired
    IPermissionRepository permissionRepository;

    @Autowired
    ITicketRepository ticketRepository;

    @Override
    public boolean createUser(User user) {
        try {
            if (user != null) {
                getCurrentSession().save(user);
                return true;
            }
        } catch (HibernateError e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateUser(User user){
        try {
            if (user != null) {
                getCurrentSession().update(user);
                return true;
            }
        } catch (HibernateError e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User getUserByUsername(String username) {
        try {
            return (User) getCurrentSession().createQuery("from User where username = :un")
                    .setParameter("un", username).getSingleResult();
        } catch (NoResultException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Ticket> getTicketByUsername (String username){
        try{
            List<Ticket> result = new ArrayList<>();
            int id = getUserByUsername(username).getId();
            List<Ticket> tickets = ticketRepository.getAll();
            for (Ticket t: tickets){
                if(t.getCustomer().getId() == id){
                    result.add(t);
                }
            }
            return result;
        }catch (HibernateError e){
            e.printStackTrace();
        }
        return null;
    }

    public void updateAvatar(String username, String avatar) {
        User user = getUserByUsername(username);
        user.setAvatar(avatar);
        getCurrentSession().update(user);
    }

    @Override
    public List<User> getAllCustomer(){
        List<User> lUser = getAll();
        List<User> lCus = new ArrayList<>();
        for (User u: lUser){
            if(u.getPermission().getName().equals("Customer"))
                lCus.add(u);
        }
        return lCus;
    }
    @Override
    public List<User> getAllDriverAndEmployee(){
        List<User> lUser = getAll();
        List<User> lCus = new ArrayList<>();
        for (User u: lUser){
            if(u.getPermission().getName().equals("Employee") || u.getPermission().getName().equals("driver"))
                lCus.add(u);
        }
        return lCus;
    }
    @Override
    public List<User> getAllDriver(){
        List<User> lUser = getAll();
        List<User> lDri = new ArrayList<>();
        for (User u: lUser){
            if(u.getPermission().getId().equals("ROLE_DRIVER"))
                lDri.add(u);
        }
        return lDri;
    }

    @Override
    public List<User> getUsersByRole(String roleId){
        try {
            return (List<User>) getCurrentSession().createQuery("from User where permission.id = :roleId")
                    .setParameter("roleId", roleId).getResultList();
        } catch (NoResultException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    @Override
    public User getUserById(int id){
        try {
            return (User) getCurrentSession().createQuery("from User where id = :id")
                    .setParameter("id", id).getSingleResult();
        } catch (NoResultException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> getAnotherUsers(String username){
        String hql = "from User where username <> :un";

        return (List<User>) getCurrentSession().createQuery(hql)
                .setParameter("un", username).getResultList();
    }

    @Override
    public List<User> getDrivers() {
        // Lấy driver chưa có xe
        String hql = "from User where permission.id = 'ROLE_DRIVER' and id not in "
                + "(select u.id from User as u join Vehicle as v on u.id = v.driver.id)";
        // Lấy driver có xe nhưng

        List<User> drivers = null;
        try {
            drivers = (List<User>) getCurrentSession().createQuery(hql).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return drivers;
    }
}

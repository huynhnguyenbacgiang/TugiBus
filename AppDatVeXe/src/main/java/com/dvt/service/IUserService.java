package com.dvt.service;

import com.dvt.pojos.Permission;
import com.dvt.pojos.Ticket;
import com.dvt.pojos.User;
import com.dvt.pojos.Trip;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends IGenericsServevice<User>, UserDetailsService {
    boolean createUser(User user);
    boolean updateUser(User user);
    public String enCode(String s);
    public User getUserByUsername(String username);
    public List<User> getUsersByRole(String roleId);
    public List<Ticket> getTicketByUsername (String username);
    public void updateAvatar(String username, String avatar);
    public List<User> getAllCustomer();
    public List<User> getAllDriverAndEmployee();
    public List<User> getAllDriver();
    public User getUserById(int id);
    public List<User> getAnotherUsers(String username);
    public List<User> getDrivers();
}

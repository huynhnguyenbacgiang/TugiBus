package com.dvt.repository;

import com.dvt.pojos.Permission;
import com.dvt.pojos.Ticket;
import com.dvt.pojos.Trip;
import com.dvt.pojos.User;

import java.util.List;

public interface IUserRepository extends IGenericsRepository<User> {
    boolean createUser(User user);
    boolean updateUser(User user);
    public User getUserByUsername(String username);
    public List<User> getUsersByRole(String roleId);
    public List<Ticket> getTicketByUsername (String username);
    public void updateAvatar(String username, String avatar);
    public List<User> getAllCustomer();
    public List<User> getAllDriverAndEmployee();
    public List<User> getAllDriver();
    public User getUserById(int Id);
    public List<User> getAnotherUsers(String username);
    public List<User> getDrivers();
}

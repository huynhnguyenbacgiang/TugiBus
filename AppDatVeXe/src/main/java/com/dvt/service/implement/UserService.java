package com.dvt.service.implement;

import com.dvt.pojos.Permission;
import com.dvt.pojos.Ticket;
import com.dvt.pojos.User;
import com.dvt.repository.IUserRepository;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("userDetailsService")
@Transactional
public class UserService extends GenericsService<User> implements IUserService {
    @Autowired
    IUserRepository userRepository;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public boolean createUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));

        return userRepository.createUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return userRepository.updateUser(user);
    }

    @Override
    @Transactional(readOnly = true)
    public User getUserByUsername(String username) {
        return userRepository.getUserByUsername(username);
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.getUserByUsername(username);

        if (user == null)
            throw new UsernameNotFoundException("Không tồn tại");
        Set<GrantedAuthority> authoritySet = new HashSet<>();
        authoritySet.add(new SimpleGrantedAuthority(user.getPermission().getId()));

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), authoritySet);
    }
    @Override
    public String enCode(String s){
        return bCryptPasswordEncoder.encode(s);
    }
    @Override
    public List<Ticket> getTicketByUsername(String username) {
        return userRepository.getTicketByUsername(username);
    }
    @Override
    public void updateAvatar(String username, String avatar) {
        userRepository.updateAvatar(username, avatar);
    }
    @Override
    public List<User> getUsersByRole(String roleId) {
        return userRepository.getUsersByRole(roleId);
    }
    @Override
    public List<User> getAllCustomer(){return userRepository.getAllCustomer();}
    @Override
    public List<User> getAllDriverAndEmployee(){return userRepository.getAllDriverAndEmployee();}
    @Override
    public List<User> getAllDriver(){return userRepository.getAllDriver();}
    @Override
    public User getUserById(int id){return userRepository.getUserById(id);}
    @Override
    public List<User> getAnotherUsers(String username){return userRepository.getAnotherUsers(username);}
    @Override
    public List<User> getDrivers() {
        return userRepository.getDrivers();
    }
}

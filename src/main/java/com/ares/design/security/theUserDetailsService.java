package com.ares.design.security;

import com.ares.design.domain.User;
import com.ares.design.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class theUserDetailsService implements UserDetailsService {
    private final static Logger logger = LogManager.getLogger(UserDetailsService.class);

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        logger.info("用户的用户名: {}", username);
        UserDetails userDetails = null;
        try {
            User user = userService.getUserByName(username);
            if (user == null) {
                logger.error("Not Found name " + username);
                throw new UsernameNotFoundException("Not Found name " + username);
            }
            Collection<GrantedAuthority> authList = getAuthorities();
            userDetails = new org.springframework.security.core.userdetails.User(
                    user.getUserName(), user.getUserPassword(), true, true, true, true, authList);
            user.setUserLastLoginTime(new Date());
            userService.updateUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userDetails;
    }

    private Collection<GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
        authList.add(new SimpleGrantedAuthority("ROLE_USER"));
        authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        return authList;
    }
}

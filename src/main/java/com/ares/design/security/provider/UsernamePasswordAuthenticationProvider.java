package com.ares.design.security.provider;

import com.ares.design.domain.User;
import com.ares.design.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class UsernamePasswordAuthenticationProvider implements AuthenticationProvider {
    @Autowired
    private UserService userService;

    private User getUser(String name) {
        return userService.getUserByName(name);
    }

    private void updateUser(User user) {
        user.setUserLastLoginTime(new Date());
        userService.updateUser(user);
    }

    private boolean flag = false;//是否为管理员，默认不是

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        //获取用户名
        String username = (authentication.getPrincipal() == null) ? "NONE_PROVIDED" : authentication.getName();
        //获取密码
        String password = (String) authentication.getCredentials();
        // 认证用户名
        User user = getUser(username);
        if (user == null) {
            throw new BadCredentialsException("用户不存在");
        }
        // 认证密码，暂时不加密
        if (!user.getUserPassword().equals(password)) {
            throw new BadCredentialsException("密码不正确");
        }
        if (user.getUserStatus() == 0) {
            flag = true;
        }

        updateUser(user);

        UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(username,
                authentication.getCredentials(), listUserGrantedAuthorities(username));
        result.setDetails(authentication.getDetails());
        return result;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }

    private Set<GrantedAuthority> listUserGrantedAuthorities(String username) {
        Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        if (flag) {
            authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        }
        return authorities;
    }
}

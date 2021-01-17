package com.ares.design.security;

import com.ares.design.security.theUserDetailsService;
import com.ares.design.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.annotation.Resource;
import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)  //开启权限控制的注解支持,securedEnabled表示SpringSecurity内部的权限控制注解开关
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    private UserDetailsService theUserDetailsService;

    @Resource
    private DataSource dataSource;


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(theUserDetailsService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()  //csrf不可用
                .authorizeRequests()
                .antMatchers("/", "/index", "/signup", "/static/**", "/css/**", "/js/**", "/images/**", "/fonts/**", "/lib/**").permitAll() // 这三个目录不做安全控制
                .anyRequest().authenticated()

                .and()
                .formLogin().loginPage("/signin")// 自定义的登录页面
                .permitAll()

                .and()
                .logout()
                .logoutSuccessUrl("/index")

                .and()
                .rememberMe()
                .tokenRepository(tokenRepository())
                .tokenValiditySeconds(60 * 60 * 60)
                .rememberMeParameter("remember-me");
    }


    public PersistentTokenRepository tokenRepository() {

        //存储内存，不推荐
//        InMemoryTokenRepositoryImpl memory =new InMemoryTokenRepositoryImpl();
//        return memory;
        /** 存档到数据库中 **/
        JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
        db.setDataSource(dataSource);
        return db;
    }

}

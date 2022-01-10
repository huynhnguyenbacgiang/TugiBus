package com.dvt.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

import javax.sql.DataSource;
import java.util.Properties;

import static org.hibernate.cfg.AvailableSettings.*;

@Configuration
@PropertySource("classpath:databases.properties")
public class HibernateConfig {
    @Autowired
    private Environment env;

    @Bean
    public LocalSessionFactoryBean getSessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();

        sessionFactory.setPackagesToScan("com.dvt.pojos");
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setHibernateProperties(hibernateProperties());

        return sessionFactory;
    }

    private Properties hibernateProperties() {
        Properties props = new Properties();

        props.put(DIALECT, env.getProperty("hibernate.dialect"));
        props.put(SHOW_SQL, env.getProperty("hibernate.showSql"));
        props.put(ENABLE_LAZY_LOAD_NO_TRANS
                , env.getProperty("hibernate.ENABLE_LAZY_LOAD_NO_TRANS"));

        return props;
    }

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource d = new DriverManagerDataSource();

        d.setDriverClassName(env.getProperty("hibernate.connection.driverClass"));
        d.setUrl(env.getProperty("hibernate.connection.url"));
        d.setUsername(env.getProperty("hibernate.connection.username"));
        d.setPassword(env.getProperty("hibernate.connection.password"));

        return d;
    }

    @Bean
    public HibernateTransactionManager transactionManager() {
        HibernateTransactionManager h = new HibernateTransactionManager();

        h.setSessionFactory(getSessionFactory().getObject());

        return h;
    }
}

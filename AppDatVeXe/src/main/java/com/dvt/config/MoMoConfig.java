package com.dvt.config;

import com.mservice.shared.sharedmodels.PartnerInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

@Configuration
@PropertySource("classpath:momo.properties")
public class MoMoConfig {
    @Autowired
    Environment env;

    @Bean
    public com.mservice.shared.sharedmodels.Environment environments (){

        PartnerInfo devInfo = new PartnerInfo(env.getProperty("DEV_PARTNER_CODE"), env.getProperty("DEV_ACCESS_KEY"), env.getProperty("DEV_SECRET_KEY"));
        String subDir = env.getProperty(com.mservice.shared.sharedmodels.Environment.ProcessType.PAY_GATE.name());
        com.mservice.shared.sharedmodels.Environment dev = new com.mservice.shared.sharedmodels.Environment(env.getProperty("DEV_MOMO_ENDPOINT") + subDir, devInfo, com.mservice.shared.sharedmodels.Environment.EnvTarget.DEV);
        return dev;
    }
}

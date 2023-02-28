package com.numericaideas.migration.springbootliftshiftmigration;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.server.ConfigurableWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.stereotype.Component;

@Component
public class ServerPortCustomizer implements WebServerFactoryCustomizer<ConfigurableWebServerFactory> {
	private static final Logger logger = LoggerFactory.getLogger(ServerPortCustomizer.class);

    @Override
    public void customize(ConfigurableWebServerFactory factory) {
    	String envPort = System.getenv().getOrDefault("PORT", "8090");
    	int serverPort = Integer.parseInt(envPort);
    	factory.setPort(serverPort);
    	logger.debug("=============== The server port is {} ===============", serverPort);
    }

}

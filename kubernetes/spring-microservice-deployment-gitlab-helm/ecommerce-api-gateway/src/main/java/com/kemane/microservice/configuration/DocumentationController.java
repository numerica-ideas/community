package com.kemane.microservice.configuration;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;
import springfox.documentation.swagger.web.SwaggerResource;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;

import java.util.ArrayList;
import java.util.List;

@Component
@Primary
@EnableAutoConfiguration
public class DocumentationController implements SwaggerResourcesProvider {

    @Override
    public List get() {
        List resources = new ArrayList<>();
        resources.add(swaggerResource("order-service", "/api/v1/docs/orders/v3/api-docs", "3.0"));
        resources.add(swaggerResource("product-service", "/api/v1/docs/products/v3/api-docs", "3.0"));
        resources.add(swaggerResource("sale-service", "/api/v1/docs/sales/v3/api-docs", "3.0"));
        resources.add(swaggerResource("user-service", "/api/v1/docs/users/v3/api-docs", "3.0"));
        return resources;
    }

    private SwaggerResource swaggerResource(String name, String location, String version) {
        SwaggerResource swaggerResource = new SwaggerResource();
        swaggerResource.setName(name);
        swaggerResource.setLocation(location);
        swaggerResource.setSwaggerVersion(version);
        return swaggerResource;
    }

}

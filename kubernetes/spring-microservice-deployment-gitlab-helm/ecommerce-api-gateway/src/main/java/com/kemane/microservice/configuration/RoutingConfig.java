package com.kemane.microservice.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RoutingConfig {

    @Value("${service.product}")
    private String product;
    @Value("${service.user}")
    private String user;
    @Value("${service.sale}")
    private String sale;
    @Value("${service.order}")
    private String order;
    @Bean
    public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {
        return builder.routes()

                //swagger documentation routes
                .route("ecommerce-product-service", r ->r.path("/api/v1/docs/products/**")
                        .filters(f -> f.rewritePath("^/api/v1/docs/products", ""))
                        .uri(product))
                .route("ecommerce-user-service", r ->r.path("/api/v1/docs/users/**")
                        .filters(f -> f.rewritePath("^/api/v1/docs/users", ""))
                        .uri(user))
                .route("ecommerce-sale-service", r ->r.path("/api/v1/docs/sales/**")
                        .filters(f -> f.rewritePath("^/api/v1/docs/sales", ""))
                        .uri(sale))
                .route("ecommerce-order-service", r ->r.path("/api/v1/docs/orders/**")
                        .filters(f -> f.rewritePath("^/api/v1/docs/orders", ""))
                        .uri(order))

                // routes
                .route("ecommerce-product-service", r ->r.path("/api/v1/products/**")
                        .uri(product))
                .route("ecommerce-user-service", r ->r.path("/api/v1/users/**")
                        .uri(user))
                .route("ecommerce-sale-service", r ->r.path("/api/v1/sales/**")
                        .uri(sale))
                .route("ecommerce-order-service", r ->r.path("/api/v1/orders/**")
                        .uri(order))
                .build();
    }
}

# Spring Boot Production-Ready: Enhanced Monitoring and Management using Actuator&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Fweb%2Fspring-boot-actuator&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://blog.numericaideas.com/spring-boot-actuator)

**This article was originally written by "Cedrick TAGNE" on the blog**: https://blog.numericaideas.com/spring-boot-actuator

## Introduction

In the ever-evolving world of application development, delivering robust, reliable, and scalable software is a constant challenge. As developers, we strive to not only build applications that meet functional requirements but also ensure that they perform optimally and can be effectively monitored and managed. This is where Spring Boot Actuator comes into the picture.

Spring Boot Actuator (V2.x) is a powerful toolset that provides extensive monitoring, management, and operational capabilities to Spring Boot applications. With Actuator, developers gain unparalleled visibility into the internals of their applications, allowing them to monitor various metrics, health indicators, and runtime information in real time. Moreover, Actuator facilitates seamless integration with popular monitoring systems and paves the way for efficient management of applications deployed in production environments.

In this article, we will embark on a journey to explore the vast array of features and benefits offered by Spring Boot Actuator. We will delve into the core functionalities it brings to the table and highlight how it empowers developers and system administrators to gain insights, diagnose issues, and fine-tune their Spring Boot applications for optimal performance.

Throughout the article, we will cover essential topics such as:

- **Core Functionalities of Spring Boot Actuator**
- **Setting up Spring Boot Actuator**
- **Monitoring Application Metrics**
- **Health Monitoring and Readiness Checks**
- **Security and Production Best Practices**


![Articles Featured image](images/spring-boot-actuator.png)

## Core Functionalities of Spring Boot Actuator

Spring Boot Actuator provides a rich set of features that empower developers and administrators to monitor, manage, and analyze their applications effectively. It also gives some capabilities and metrics that can help to keep a system Highly available if it's combined with other tools like Alarms and Load Balancers.
In this section, we will explore some of the core functionalities it offers.

### Predefined Endpoints

Spring Boot Actuator comes bundled with a variety of built-in endpoints that expose crucial information about your application. These endpoints provide insights into metrics, health status, configuration details, logging, and more.

### Custom Endpoints

In addition to the built-in endpoints, Actuator allows us to create custom endpoints tailored to our application's specific needs. This feature allows us to expose additional metrics, health checks and management operations that are relevant to our application. This customization capability ensures that Spring Boot Actuator can adapt to our unique requirements and integrate seamlessly into our application's monitoring infrastructure

### Metric Collection and Monitoring

Spring Boot Actuator provides comprehensive metrics collection and monitoring capabilities by collecting a wide range of metrics out of the box and providing vital information about our application's performance behavior. These metrics include HTTP request/response details, database interaction statistics, thread pool usage, cache hit rates, and many more.

Furthermore, Actuator integrates seamlessly with popular monitoring systems like Prometheus, Graphite, and Micrometer, enabling you to visualize and analyze the collected metrics using powerful monitoring and alerting tools.

### Health Monitoring and Readiness checks

Ensuring the health and readiness of our application is crucial, especially in production environments. Spring Boot Actuator's health endpoint provides a quick and convenient way to check the overall health of our application and its dependencies. It performs various checks, such as database connectivity, disk space availability, and external service availability, providing a holistic view of your application's well-being.

## Setting up Spring Boot Actuator

In this part we will go through the process of enabling Actuator in our Spring Boot project, exploring the configuration options available, and ensuring the appropriate security measures are in place.

### 1. Adding Spring Boot Actuator Dependency

Enabling Actuator in a Spring boot project is as easy as adding a dependency to a project :). You can add it during the creation of your Spring Boot App or add it in an existing project Depending on which package management you are using you can add it in `pom.xml` if you are using Maven or `build.gradle` if you are using Gradle.

#### Add Spring Boot Actuator From Spring Boot Initializer

From https://start.spring.io/, add the dependency: Add Actuator dependency from Spring initializr](images/initializr-add-actuator.png)
_(Tips: you can use the search bar to easily find it)._

At the end, you should have "Spring Boot Actuator" in your dependencies as shown in it image below.

![spring actuator added](images/initializr-actuator-added.png)

#### Add Spring Boot Actuator in existing Project

Depending on your package manager (Maven or Gradle), set your `pom.xml`or `build.gradle` as follows:

```
Pom.xml
<!-- Maven -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
```

```
// Gradle
implementation 'org.springframework.boot:spring-boot-starter-actuator'
```

By adding this dependency, you bring Actuator's functionality into your application, allowing you to utilize its endpoints, metrics collection, and management capabilities.

Once the dependency is added, assuming you started the App, you will be able to see endpoints actually available through: http://localhost:8080/actuator

You should have the following result:
![Actuator default exposed endpoints](images/default-actuator-enpoint.png)

### 2. Configuring Actuator Endpoints

As you can see in the previous image, Only one Endpoint is exposed (the health check endpoint). In this section, we will go through Actuator's endpoints configuration.

#### Expose all Spring Boot Actuator's endpoints

Spring Boot Actuator provides several endpoints to expose various information and functionality. You can configure which endpoints are enabled and set their specific properties by modifying your application's **application.properties** or **application.yml** file.

For example, to enable all Actuator endpoints, add the following configuration in application.properties:

in **_application.properties_**

```text
management.endpoints.web.exposure.include=*
```

or in **_application.yml_**

```
management:
  endpoints:
    web:
      exposure:
        include: '*'
```

Once added you will have all 13 endpoints (except the shutdown endpoint) of Spring Boot Actuator exposed, under the /actuator endpoint

```json
{
  "_links": {
    "self": {
      "href": "http://localhost:8080/actuator",
      "templated": false
    },
    "beans": {
      "href": "http://localhost:8080/actuator/beans",
      "templated": false
    },
    "caches-cache": {
      "href": "http://localhost:8080/actuator/caches/{cache}",
      "templated": true
    },
    "caches": {
      "href": "http://localhost:8080/actuator/caches",
      "templated": false
    },
    "health": {
      "href": "http://localhost:8080/actuator/health",
      "templated": false
    },
    "health-path": {
      "href": "http://localhost:8080/actuator/health/{*path}",
      "templated": true
    },
    "info": {
      "href": "http://localhost:8080/actuator/info",
      "templated": false
    },
    "conditions": {
      "href": "http://localhost:8080/actuator/conditions",
      "templated": false
    },
    "configprops": {
      "href": "http://localhost:8080/actuator/configprops",
      "templated": false
    },
    "configprops-prefix": {
      "href": "http://localhost:8080/actuator/configprops/{prefix}",
      "templated": true
    },
    "env": {
      "href": "http://localhost:8080/actuator/env",
      "templated": false
    },
    "env-toMatch": {
      "href": "http://localhost:8080/actuator/env/{toMatch}",
      "templated": true
    },
    "loggers": {
      "href": "http://localhost:8080/actuator/loggers",
      "templated": false
    },
    "loggers-name": {
      "href": "http://localhost:8080/actuator/loggers/{name}",
      "templated": true
    },
    "heapdump": {
      "href": "http://localhost:8080/actuator/heapdump",
      "templated": false
    },
    "threaddump": {
      "href": "http://localhost:8080/actuator/threaddump",
      "templated": false
    },
    "metrics-requiredMetricName": {
      "href": "http://localhost:8080/actuator/metrics/{requiredMetricName}",
      "templated": true
    },
    "metrics": {
      "href": "http://localhost:8080/actuator/metrics",
      "templated": false
    },
    "scheduledtasks": {
      "href": "http://localhost:8080/actuator/scheduledtasks",
      "templated": false
    },
    "mappings": {
      "href": "http://localhost:8080/actuator/mappings",
      "templated": false
    }
  }
}
```

As you can see this exposes all the management and monitoring endpoints and metrics (except the shutdown endpoint) that Actuator provides, and it can be a security issue since it allows to get too much information about the application.

To avoid that we can:

#### Expose only some Actuator's endpoints

To do that, we will update our **_application.properties_** or **_application.yml_** by listing endpoints we want to expose as follows

**_application.properties_**

```properties
management.endpoints.jmx.exposure.include=health,info
```

**_application.yml_**

```yml
management:
  endpoints:
    jmx:
      exposure:
        include: "health,info"
```

or we can also enable its specific endpoint by using its (_management.endpoint.<id>.enabled_) property as follows:

ex: enabling shutdown endpoint

**_application.properties_**

```properties
management.endpoint.shutdown.enabled=true
```

**_application.yml_**

```yml
management:
  endpoint:
    shutdown:
      enabled: true
```

#### Disable or Hide Certain Actuator Endpoints

Let's say you have many endpoints to expose and just a few to hide, rather than listing them all you can expose all and then just hide endpoints you don't need.

To do that, we will update our **_application.properties_** or **_application.yml_** enabling all and then hide the few we need to:

**_application.properties_**

```properties
management.endpoints.web.exposure.include=*
management.endpoints.web.exposure.exclude=env,beans
```

**_application.yml_**

```yml
management:
  endpoints:
    web:
      exposure:
        include: "*"
        exclude: "env,beans"
```

#### Securing Spring Boot Actuators endpoints using Spring Security and CORS Support

As Actuator exposes sensitive information about your application, it's vital to secure its endpoints to prevent unauthorized access. By default, Actuator endpoints are not secured, allowing unrestricted access. To secure the endpoints, you can leverage Spring Security's authentication and authorization mechanisms and also enable CORS so only calls from accepted origins will be able to have access.

For example, to enable basic authentication for Actuator endpoints, add the following configuration in **_application.properties_**:

**_application.properties_**

```properties
spring.security.user.name=admin
spring.security.user.password=secret
```

**_application.yml_**

```yml
spring:
  security:
    user:
      name: admin
      password: secret
```

With this configuration, accessing Actuator endpoints requires providing valid credentials. Going forward with Spring Security, it will be possible to secure only some endpoints and also define a specific role that has the right to access them using **_SecurityFilterChain_**(but it's not the scope of our article).

To enable CORS, we have to update our application properties:

**_application.properties_**

```properties
management.endpoints.web.cors.allowed-origins=https://example.com
management.endpoints.web.cors.allowed-methods=GET,POST
```

**_application.yml_**

```yml
management:
  endpoints:
    web:
      cors:
        allowed-origins: "https://example.com"
        allowed-methods: "GET,POST"
```

#### Customizing Actuator Endpoint Paths

By default, Actuator endpoints are accessible under the /actuator path. However, you can customize the base path according to your application's requirements. To change the base path, modify your application.properties or application.yml file:

**_application.properties_**

```properties
management.endpoints.web.base-path=/custom-actuator
```

**_application.yml_**

```yml
management:
  endpoints:
    web:
      base-path: /custom-actuator
```

With this configuration, Actuator endpoints will be accessible under the /custom-actuator path.

## Monitoring Application Metrics

Spring Boot Actuator's monitoring capabilities provide developers with a treasure trove of insights into their application's performance and behavior. In this section, we will explore how to leverage Actuator's metrics endpoints to monitor key performance indicators and gain valuable data-driven insights.

### 1. Accessing Metrics Endpoints

To access the metrics, simply make an HTTP GET request to the **_/actuator/metrics_** endpoint:

```json
{
  "names": [
    "application.ready.time",
    "application.started.time",
    "disk.free",
    "disk.total",
    "executor.active",
    "executor.completed",
    "executor.pool.core",
    "executor.pool.max",
    "executor.pool.size",
    "executor.queue.remaining",
    "executor.queued",
    "http.server.requests",
    "http.server.requests.active",
    "jvm.buffer.count",
    "jvm.buffer.memory.used",
    "jvm.buffer.total.capacity",
    "jvm.classes.loaded",
    "jvm.classes.unloaded",
    "jvm.compilation.time",
    "jvm.gc.live.data.size",
    "jvm.gc.max.data.size",
    "jvm.gc.memory.allocated",
    "jvm.gc.memory.promoted",
    "jvm.gc.overhead",
    "jvm.info",
    "jvm.memory.committed",
    "jvm.memory.max",
    "jvm.memory.usage.after.gc",
    "jvm.memory.used",
    "jvm.threads.daemon",
    "jvm.threads.live",
    "jvm.threads.peak",
    "jvm.threads.started",
    "jvm.threads.states",
    "logback.events",
    "process.cpu.usage",
    "process.start.time",
    "process.uptime",
    "system.cpu.count",
    "system.cpu.usage",
    "tomcat.sessions.active.current",
    "tomcat.sessions.active.max",
    "tomcat.sessions.alive.max",
    "tomcat.sessions.created",
    "tomcat.sessions.expired",
    "tomcat.sessions.rejected"
  ]
}
```

This will return a list of available metrics, along with their respective values. However, the list might be extensive and overwhelming. To retrieve specific metrics, you can append the desired metric name to the endpoint:

`GET /actuator/metrics/{metricName}`

For example, the endpoint to get the metric **_application.ready.time_** will be:
`GET /actuator/metrics/application.ready`.time` which will result in something like:

```json
{
  "name": "application.ready.time",
  "description": "Time taken (ms) for the application to be ready to service requests",
  "baseUnit": "seconds",
  "measurements": [
    {
      "statistic": "VALUE",
      "value": 4.027
    }
  ],
  "availableTags": [
    {
      "tag": "main.application.class",
      "values": ["com.example.demo.DemoApplication"]
    }
  ]
}
```

### 2. Monitoring Metrics

One of the most critical aspects of any web application is how it handles HTTP requests. Actuator provides detailed metrics about incoming requests, including the number of requests, response times, and status codes.

By analyzing these metrics, you can identify patterns of heavy traffic, detect potential performance issues, and optimize your application for better response times.

Spring Boot Actuator provides dependency management and auto-configuration for Micrometer, an application metrics facade that supports numerous monitoring systems that will facilitate monitoring and system tracking. 

Spring Boot Actuator provides metrics on many app components. In addition to network traffic metrics, we can also retrieve metrics like 

- **Database Interactions:** Actuator allows you to monitor the number of database queries, their execution times, and other essential database-related metrics.

- **JVM and Memory Utilization:** Actuator's metrics also provide insights into the Java Virtual Machine (JVM) and memory usage. By monitoring JVM-related metrics, such as garbage collection times and memory pool utilization, you can ensure your application's memory consumption is optimized

- **Application Startup Metrics:** as ```application.started.time``` or ```application.ready.time```

- **Logger Metrics:** Auto-configuration enables the event metrics for both Logback and Log4J2. The details are published under the _log4j2.events._ or _logback.events._ meter names.

- **Custom Metrics:** n addition to the built-in metrics, Actuator allows you to create and expose custom metrics. This feature is especially useful for monitoring application-specific business metrics and key performance indicators unique to your domain. By defining and tracking custom metrics, you can gain deeper insights into the specific aspects of your application that matter most, making data-driven decisions to enhance its overall performance.

Other than these metrics, Spring Boot Actuator provides the capability to have a bunch of metrics depending on what we are using in our application and they are enabled from Actuator Auto-configuration.

## Health Monitoring and Readiness Checks

Ensuring the health and readiness of your application is paramount, especially in production environments. Spring Boot Actuator's health monitoring and readiness checks offer powerful tools to proactively manage the well-being of your application. In this section, we will delve into Actuator's health endpoint and demonstrate how to perform readiness checks to ensure your application is always prepared to handle incoming requests.

### 1. Health Endpoint
The **_/actuator/health_** endpoint is one of the most important features of Spring Boot Actuator. It provides a comprehensive health check of your application and its dependencies. When you make an HTTP GET request to this endpoint, Spring Boot Actuator performs a series of checks to determine if the application is in a healthy state.

The health endpoint response includes information about the status of various components and services your application relies on, such as the database, messaging queues, and external APIs. It uses a simple and intuitive status code system, where a **_200 OK_** response indicates that everything is healthy, and a **_503 Service Unavailable_** response indicates potential issues.

This information is invaluable for system administrators and DevOps teams to monitor the overall health of the application and act proactively in case of any detected problems.

### 2. Custom Health Indicators

Spring Boot Actuator's health endpoint is extendable through custom health indicators. These indicators allow you to add application-specific checks and contribute to the overall health status. For example, you can create a custom health indicator to verify the connectivity and responsiveness of an external service crucial to your application's functionality.

To create a custom health indicator, you need to implement the **_HealthIndicator_** interface provided by Spring Boot Actuator. By overriding its **_health()_** method, you can define the logic for your specific health check.

```java 
import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.stereotype.Component;

@Component
public class CustomHealthIndicator implements HealthIndicator {

    @Override
    public Health health() {
        // Implement your custom health check logic here
        // Return Health.up() for healthy status or Health.down() for unhealthy status
    }
}
```
Actuator will automatically discover and include your custom health indicator in the health endpoint response.



### 3. Readiness Checks
While the health endpoint assesses the overall health of your application, readiness checks focus on whether your application is ready to handle incoming requests. This is particularly important during application startup or when deploying updates.

Readiness checks verify if all essential resources and dependencies are up and running. For instance, you can use readiness checks to ensure that the database is accessible, caches are loaded, and any required external services are available.

Implementing readiness checks is similar to creating custom health indicators. By defining and registering readiness checks, you can prevent your application from receiving user requests until it is fully operational.

### 4. Customizing Health and Readiness Endpoints

Just like other Actuator endpoints, you can customize the paths for the health and readiness endpoints to better suit your application's needs. This can be achieved through the application's **_application.properties_** or **_application.yml_** file:

**_application.properties_**
```
# Custom health endpoint path
management.endpoints.web.path-mapping.health=/custom-health

# Custom readiness endpoint path
management.endpoints.web.path-mapping.readiness=/custom-readiness
```
**_application.yml_**
```yml
management:
  endpoints:
    web:
      path-mapping:
        health: /custom-health
        readiness: /custom-readiness
```
With these configurations, your health and readiness checks will be accessible at /custom-health and /custom-readiness, respectively.

### 5. Monitoring Health and Readiness in Production

In production environments, it is essential to continuously monitor the health and readiness of your application. Spring Boot Actuator's health and readiness endpoints are valuable tools for this purpose. Monitoring tools and services can make periodic requests to these endpoints to ensure that your application remains in a healthy and ready state.

Proactive monitoring allows your team to address potential issues before they escalate, ensuring a smooth user experience and minimizing downtime.

In the final section of this article, we will discuss best practices for securing Actuator endpoints and highlight key considerations when deploying your application with Actuator enabled.

## Security and Production Best Practices

Securing Actuator endpoints is of utmost importance when deploying your application to production environments. Exposing sensitive information without adequate protection could pose significant security risks. In this section, we will explore best practices for securing Actuator endpoints and ensuring that only authorized users have access to critical information.

### 1. Enable Production-Ready Security

Spring Boot Actuator provides production-ready security features that you can easily enable to protect the Actuator endpoints. By default, Actuator security is disabled, but it's crucial to enable it before deploying your application to production.

To enable Actuator security, add the following configuration to your **_application.properties_** or **_application.yml_** file:

**_application.properties_**
```properties
# Enable Actuator security
management.endpoints.web.exposure.include=health,info
management.endpoints.web.exposure.exclude=*
management.endpoints.web.base-path=/actuator
management.endpoint.health.roles=ACTUATOR_ADMIN
management.endpoint.info.roles=ACTUATOR_ADMIN
```
**_application.yml_**

```yml 
# Enable Actuator security
management:
  endpoints:
    web:
      exposure:
        include: health,info
        exclude: "*"
      base-path: /actuator
  endpoint:
    health:
      roles: ACTUATOR_ADMIN
    info:
      roles: ACTUATOR_ADMIN
```
In the above configuration, we have explicitly included only the ***health*** and ***info*** endpoints, and we have set their base path to ***/actuator***. We have also restricted access to these endpoints by specifying that only users with the role ***ACTUATOR_ADMIN*** can access them.

### 2. Define Custom Roles and Users
By default, Spring Boot Actuator uses Spring Security's basic authentication, which requires a username and password to access the endpoints. However, it's recommended to define custom roles and users for better security control.

You can define custom roles and users in your ***WebSecurityConfigurerAdapter*** configuration class as follows:

```java
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/actuator/**").hasRole("ACTUATOR_ADMIN")
                .and()
                .httpBasic();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("admin")
                .password("{noop}adminPassword") // Use appropriate password encoder in production
                .roles("ACTUATOR_ADMIN");
    }
}
```
In this example, we have defined a custom role ***ACTUATOR_ADMIN*** and a user with the username ***admin*** and password ***adminPassword***. Note that in a production environment, you should use an appropriate password encoder, such as BCryptPasswordEncoder, instead of ***{noop}***.

### 3. Enable HTTPS
In production environments, it is essential to enable HTTPS to secure the communication between clients and Actuator endpoints. HTTPS ensures data confidentiality and integrity, preventing eavesdropping and tampering.

To enable HTTPS, you need to configure your web server (e.g., Tomcat, Jetty) to use SSL/TLS certificates. Additionally, you can enforce HTTPS by redirecting HTTP requests to HTTPS.

### 4. Monitor and Log Access

Keep a close eye on access logs for the Actuator endpoints, especially in production. Monitor the logs for any unauthorized access attempts and promptly investigate any suspicious activities. Additionally, consider implementing a logging mechanism to track and review access to Actuator endpoints.

By adhering to these best practices, you can secure your Actuator endpoints and protect sensitive information from unauthorized access, mitigating potential security risks.

### Need more?

- In this Article, we mainly talked about Actuator HTTP endpoints and metrics, but we can also access them over JMX(Java Management Extensions) which is not enabled by default but we can easily enable it using property ``spring.jmx.enabled=true``
- Monitoring and metrics work best when they are integrated with other architecture items such as Monitoring systems, Load balancers and Alerts, So we are announcing here 2 upcoming articles ( **how to use Spring boot actuator health checks to configure a Load Balancer** and  **How to integrate Spring Boot Actuator with Monitoring Systems**)


The complete source code of the project is available on GitHub.

## Conclusion
Spring Boot Actuator is a powerful toolset that unlocks enhanced monitoring and management capabilities for your Spring Boot applications. By leveraging Actuator's metrics, health monitoring, and readiness checks, you can gain valuable insights into your application's performance, proactively manage its health, and ensure optimal functionality in production environments.

In this article, we explored the core functionalities of Spring Boot Actuator, learned how to set it up and configure it to suit our application's requirements, and implemented security measures to protect sensitive data.

By incorporating Spring Boot Actuator into your development workflow, you can take your application monitoring and management to the next level, ultimately delivering a more robust and reliable experience for your end-users.


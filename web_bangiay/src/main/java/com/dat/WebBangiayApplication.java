package com.dat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
//import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

//@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
@SpringBootApplication
//@EnableFeignClients
//@EnableMongoRepositories("com.dat.repositories")
public class WebBangiayApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebBangiayApplication.class, args);
	}

}

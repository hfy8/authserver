package com.auth.authserver.config;

import com.auth.authserver.inerceptor.FeignBasicAuthRequestInterceptor;
import feign.RequestInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @ClassName FeignSupportConfig
 * @Date 2018/12/13 10:32
 * @Auther bianjie
 **/
@Configuration
public class FeignSupportConfig {
    /**
     * feign请求拦截器
     *
     * @return
     */
    @Bean
    public RequestInterceptor requestInterceptor(){
        return new FeignBasicAuthRequestInterceptor();
    }
}

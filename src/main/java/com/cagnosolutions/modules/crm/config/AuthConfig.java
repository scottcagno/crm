package com.cagnosolutions.modules.crm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.sql.DataSource;

@Configuration
@EnableWebMvcSecurity
public class AuthConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("admin").password("admin").roles("ADMIN");
		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(new BCryptPasswordEncoder())
				.usersByUsernameQuery("SELECT username, password, active FROM user WHERE username=?")
				.authoritiesByUsernameQuery("SELECT username, role FROM user WHERE username=?");
	}

	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/admin/**")
				.hasAnyRole("ADMIN")
				.antMatchers("/secure/**")
				.hasAnyRole("ADMIN", "USER");
		http.formLogin().loginPage("/login")
				.defaultSuccessUrl("/")
				.successHandler(new CustomAuthenticationSuccessHandler());
		http.logout().invalidateHttpSession(true)
				.logoutSuccessUrl("/login")
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout", "GET"));
		http.sessionManagement()
				.maximumSessions(1)
				.expiredUrl("/login?expired")
				.maxSessionsPreventsLogin(false).and()
				.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED);
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Autowired
	private DataSource dataSource;
}

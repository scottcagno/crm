package com.cagnosolutions.modules.crm;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	//RequestCache requestCache = new HttpSessionRequestCache()


	public CustomAuthenticationSuccessHandler() {}

	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
										Authentication authentication) throws IOException, ServletException {

		//SavedRequest savedRequest = requestCache.getRequest(request, response);

		//String successUrl = "/login/success";

		/*authentication.authorities.each { authority ->
			switch ((authority as GrantedAuthority).authority) {
				case "ROLE_USER":
					successUrl += "?role=user"
					break
				case "ROLE_ADMIN":
					successUrl += "?role=admin"
					break
			}
		}*/
		redirectStrategy.sendRedirect(request, response, "/login/success");
	}
}

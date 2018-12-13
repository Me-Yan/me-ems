package com.me.inner.filter;

import com.me.inner.dto.BaseUserDetails;
import com.me.inner.token.CustomAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Me on 2018/8/18.
 */
public class CustomAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

    public Authentication attemptAuthentication(HttpServletRequest request,
                                                HttpServletResponse response) throws AuthenticationException {

        String username = obtainUsername(request);
        String password = obtainPassword(request);

        if (username == null) {
            username = "";
        }

        if (password == null) {
            password = "";
        }

        username = username.trim();

        CustomAuthenticationToken authRequest = new CustomAuthenticationToken(
                null, null);

        BaseUserDetails userDetails = new BaseUserDetails();
        userDetails.setUsername(username);
        userDetails.setPassword(password);

        authRequest.setPrincipal(userDetails);
        authRequest.setCredentials(password);
        authRequest.setName(username);

        setDetails(request, authRequest);

        return this.getAuthenticationManager().authenticate(authRequest);
    }
}

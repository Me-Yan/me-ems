package com.me.inner.filter;

import com.me.inner.constant.CommonConstant;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Me on 2018/9/16.
 */
public class FrameOptionsFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        chain.doFilter(request, response);
        ((HttpServletResponse) response).setHeader("X-Frame-Options", CommonConstant.FrameOption.SAMEORIGIN);
    }

    public void destroy() {

    }
}

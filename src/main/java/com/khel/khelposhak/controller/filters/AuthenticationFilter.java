package com.khel.khelposhak.controller.filters;

import com.khel.khelposhak.utils.SessionUtil;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author akashadhikari
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/*"})
public class AuthenticationFilter implements Filter {

    private static final String LOGIN = "/LogServ";
    private static final String LOGIN_PAGE = "/pages/login.jsp";
    private static final String REGISTER = "/regServ";
    private static final String REGISTER_PAGE = "/pages/register.jsp";
    private static final String HOME = "/homeS";
    private static final String HOME_PAGE = "/pages/home.jsp";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

   @Override
public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws IOException, ServletException {

    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse res = (HttpServletResponse) response;

    String uri = req.getRequestURI();
    boolean isLoggedIn = SessionUtil.getAttribute(req, "user") != null;

    boolean isHomePage = uri.endsWith(HOME) || uri.endsWith(HOME_PAGE);
    boolean isAuthPage = uri.endsWith(LOGIN) || uri.endsWith(LOGIN_PAGE)
            || uri.endsWith(REGISTER) || uri.endsWith(REGISTER_PAGE);

    String context = req.getContextPath();

    // If not logged in
    if (!isLoggedIn) {
        if (isAuthPage || isHomePage) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(context + LOGIN_PAGE);
        }
        return;
    }

    // If logged in
    if (isAuthPage) {
        res.sendRedirect(context + HOME_PAGE);
        return;
    }

    chain.doFilter(request, response);
}

    @Override
    public void destroy() {
    }

}

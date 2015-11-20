/*
 * get from http://blog.arhs-group.com/post/103641943259/staying-restful-when-your-reverse-proxy-prevents
 */

package np.web.filter;

import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;

/**
 * {@link javax.servlet.Filter} that converts the X-HTTP-Method-Override into HTTP methods, retrievable via
 * {@link HttpServletRequest#getMethod()}.
 */
public class XHttpMethodOverrideFilter extends OncePerRequestFilter {

	public static final String HTTP_METHOD_OVERRIDE_HEADER_NAME = "X-HTTP-Method-Override";

	@Override
	protected void doFilterInternal(final HttpServletRequest request, final HttpServletResponse response,
	                                final FilterChain filterChain) throws ServletException, IOException {

		final String headerValue = request.getHeader(HTTP_METHOD_OVERRIDE_HEADER_NAME);
		if ("POST".equals(request.getMethod()) && StringUtils.hasLength(headerValue)) {
			final String method = headerValue.toUpperCase(Locale.ENGLISH);
			final HttpServletRequest wrapper = new HttpMethodRequestWrapper(request, method);
			filterChain.doFilter(wrapper, response);
		} else {
			filterChain.doFilter(request, response);
		}
	}

	/**
	 * Simple {@link HttpServletRequest} wrapper that returns the supplied method for
	 * {@link HttpServletRequest#getMethod()}.
	 */
	private static class HttpMethodRequestWrapper extends HttpServletRequestWrapper {

		private final String method;

		/**
		 * Constructor.
		 *
		 * @param request the wrapped request
		 * @param method  the overridden method
		 */
		public HttpMethodRequestWrapper(final HttpServletRequest request, final String method) {
			super(request);
			this.method = method;
		}

		@Override
		public String getMethod() {
			return method;
		}
	}
}

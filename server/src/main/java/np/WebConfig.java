package np;

import java.util.List;

import com.thoughtworks.xstream.XStream;

import flex.messaging.io.MessageIOConstants;

import np.web.filter.XHttpMethodOverrideFilter;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.flex.http.AmfHttpMessageConverter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.converter.xml.MarshallingHttpMessageConverter;
import org.springframework.oxm.xstream.XStreamMarshaller;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.servlet.Filter;

@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {

	@Override
	public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
		configurer
			.defaultContentType(MediaType.APPLICATION_XML)
			.mediaType("amf", MediaType.parseMediaType(MessageIOConstants.AMF_CONTENT_TYPE))
		;
	}

	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		converters.add(createXmlHttpMessageConverter());
		converters.add(new MappingJackson2HttpMessageConverter());
		converters.add(new AmfHttpMessageConverter());
	}

	private HttpMessageConverter<Object> createXmlHttpMessageConverter() {
		MarshallingHttpMessageConverter xmlConverter = new MarshallingHttpMessageConverter();
 
		XStreamMarshaller xStreamMarshaller = new XStreamMarshaller();
		xStreamMarshaller.setAutodetectAnnotations(true);
		XStream xStream = xStreamMarshaller.getXStream();
		xStream.setMode(XStream.NO_REFERENCES);
		xStream.addDefaultImplementation(java.sql.Date.class,java.util.Date.class);
		xStream.addDefaultImplementation(java.sql.Timestamp.class, java.util.Date.class);
		xStream.addDefaultImplementation(java.sql.Time.class, java.util.Date.class);

		xmlConverter.setMarshaller(xStreamMarshaller);
		xmlConverter.setUnmarshaller(xStreamMarshaller);

		return xmlConverter;
	}

	@Bean
	public Filter xHttpMethodOverrideFilter() {
		return new XHttpMethodOverrideFilter();
	}
}

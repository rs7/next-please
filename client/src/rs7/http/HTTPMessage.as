package rs7.http
{
    import rs7.http.header.HTTPHeaders;
    import rs7.http.header.IHTTPHeaders;
    
    use namespace http_internal;
    
    public class HTTPMessage implements IHTTPMessage
    {
        http_internal var headers:HTTPHeaders;
        
        public function get headers():IHTTPHeaders
        {
            return http_internal::headers;
        }
    }
}

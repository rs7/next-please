package rs7.http.message
{
    import rs7.http.header.HTTPHeaders;
    import rs7.http.header.IHTTPHeaders;
    import rs7.http.http_internal;
    
    use namespace http_internal;
    
    public class HTTPMessage implements IHTTPMessage
    {
        http_internal var headers:HTTPHeaders = new HTTPHeaders();
        
        public function get headers():IHTTPHeaders
        {
            return http_internal::headers;
        }
    }
}

package rs7.http
{
    use namespace http_internal;
    
    public class HTTPRequest extends HTTPOutputMessage implements IHTTPRequest
    {
        http_internal var method:HTTPMethod;
        http_internal var uri:URI;
        
        public function get method():HTTPMethod
        {
            return http_internal::method;
        }
        
        public function get uri():URI
        {
            return http_internal::uri;
        }
    }
}

package rs7.http
{
    use namespace http_internal;
    
    public class HTTPRequestCreator implements IHTTPRequestCreator
    {
        public function create(method:HTTPMethod, uri:String):HTTPRequest
        {
            var request:HTTPRequest = new HTTPRequest();
        
            request.http_internal::uri = new URI(uri);
            request.http_internal::method = method;
        
            return request;
        }
    }
}

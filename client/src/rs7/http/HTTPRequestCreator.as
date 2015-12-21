package rs7.http
{
    use namespace http_internal;
    
    public class HTTPRequestCreator
    {
        public function create(method:HTTPMethod, uri:String):HTTPRequest
        {
            var request:HTTPRequest = new HTTPRequest();
            
            request.uri = new URI(uri);
            request.method = method;
            
            return request;
        }
    }
}

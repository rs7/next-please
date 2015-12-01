package rs7.http
{
    import rs7.http.header.HTTPHeaders;
    
    public class HTTPMessage implements IHTTPMessage
    {
        private var _headers:HTTPHeaders = new HTTPHeaders();
        
        public function get headers():HTTPHeaders
        {
            return _headers;
        }
    }
}

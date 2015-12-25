package rs7.http.request
{
    import rs7.http.message.HTTPOutputMessage;
    import rs7.http.method.HTTPMethod;
    import rs7.http.uri.URI;
    
    public class HTTPRequest extends HTTPOutputMessage implements IHTTPRequest
    {
        private var _method:HTTPMethod;
        private var _uri:URI;
        
        public function get method():HTTPMethod
        {
            return _method;
        }
        
        public function set method(value:HTTPMethod):void
        {
            _method = value;
        }
        
        public function get uri():URI
        {
            return _uri;
        }
        
        public function set uri(value:URI):void
        {
            _uri = value;
        }
    }
}

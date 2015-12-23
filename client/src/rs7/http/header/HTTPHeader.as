package rs7.http.header
{
    import rs7.http.http_internal;
    
    use namespace http_internal;
    
    public class HTTPHeader implements IHTTPHeader
    {
        public function HTTPHeader(name:String = null, value:String = null)
        {
            http_internal::name = name;
            http_internal::value = value;
        }
        
        http_internal var name:String;
        http_internal var value:String;
        
        public function get name():String
        {
            return http_internal::name;
        }
        
        public function get value():String
        {
            return http_internal::value;
        }
    }
}

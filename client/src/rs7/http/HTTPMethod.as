package rs7.http
{
    import rs7.lang.Enum;
    
    public class HTTPMethod extends Enum
    {
        public static const DELETE:HTTPMethod = new HTTPMethod("DELETE");
        public static const GET:HTTPMethod = new HTTPMethod("GET");
        public static const POST:HTTPMethod = new HTTPMethod("POST");
        public static const PUT:HTTPMethod = new HTTPMethod("PUT");
        
        public function HTTPMethod(value:String)
        {
            _value = value;
        }
        
        private var _value:String;
        
        public function get value():String
        {
            return _value;
        }
    }
}

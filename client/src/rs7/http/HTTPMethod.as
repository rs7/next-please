package rs7.http
{
    import rs7.lang.enum.Enum;
    
    public class HTTPMethod extends Enum
    {
        public static const DELETE:HTTPMethod = new HTTPMethod("DELETE");
        public static const GET:HTTPMethod = new HTTPMethod("GET");
        public static const POST:HTTPMethod = new HTTPMethod("POST");
        public static const PUT:HTTPMethod = new HTTPMethod("PUT");
        
        public function HTTPMethod(name:String)
        {
            super(name);
            _name = name;
        }
        
        private var _name:String;
        
        public function get name():String
        {
            return _name;
        }
    }
}

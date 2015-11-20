package rs7.http.header
{
    public class HTTPHeader implements IHTTPHeader
    {
        public function HTTPHeader(name:String, value:String)
        {
            _name = name;
            _value = value;
        }
        
        private var _name:String;
        private var _value:String;
        
        public function get name():String
        {
            return _name;
        }
        
        public function get value():String
        {
            return _value;
        }
    }
}

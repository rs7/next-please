package rs7.http
{
    public class URI
    {
        public function URI(value:String)
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

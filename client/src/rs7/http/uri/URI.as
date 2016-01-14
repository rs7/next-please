package rs7.http.uri
{
    import mx.utils.StringUtil;
    
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
        
        public function resolve(from:URI):URI
        {
            return new URI(StringUtil.substitute("{0}/{1}", from.value, value));
        }
    }
}

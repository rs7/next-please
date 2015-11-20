package rs7.http
{
    import rs7.lang.Enum;
    
    public class MimeType extends Enum
    {
        public static const AMF:MimeType = new MimeType("application/x-amf");
        
        public function MimeType(value:String)
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

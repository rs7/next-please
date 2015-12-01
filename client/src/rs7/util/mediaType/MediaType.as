package rs7.util.mediaType
{
    import rs7.lang.enum.Enum;
    
    public class MediaType extends Enum
    {
        public static const AMF:MediaType = new MediaType("amf");
        public static const JSON:MediaType = new MediaType("json");
        public static const XML:MediaType = new MediaType("xml");
        
        public function MediaType(name:String)
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

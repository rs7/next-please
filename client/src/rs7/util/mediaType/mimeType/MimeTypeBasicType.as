package rs7.util.mediaType.mimeType
{
    import rs7.lang.enum.Enum;
    
    public class MimeTypeBasicType extends Enum
    {
        public static const APPLICATION:MimeTypeBasicType = new MimeTypeBasicType("application");
        public static const AUDIO:MimeTypeBasicType = new MimeTypeBasicType("audio");
        public static const EXAMPLE:MimeTypeBasicType = new MimeTypeBasicType("example");
        public static const IMAGE:MimeTypeBasicType = new MimeTypeBasicType("image");
        public static const MESSAGE:MimeTypeBasicType = new MimeTypeBasicType("message");
        public static const MODEL:MimeTypeBasicType = new MimeTypeBasicType("model");
        public static const MULTIPART:MimeTypeBasicType = new MimeTypeBasicType("multipart");
        public static const TEXT:MimeTypeBasicType = new MimeTypeBasicType("text");
        public static const VIDEO:MimeTypeBasicType = new MimeTypeBasicType("video");
        
        function MimeTypeBasicType(name:String)
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

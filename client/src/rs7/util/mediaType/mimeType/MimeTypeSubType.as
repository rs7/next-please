package rs7.util.mediaType.mimeType
{
    import rs7.lang.enum.Enum;
    import rs7.util.mediaType.MediaType;
    
    public class MimeTypeSubType extends Enum
    {
        public static const AMF:MimeTypeSubType = new MimeTypeSubType(MediaType.AMF, false);
        
        public function MimeTypeSubType(mediaType:MediaType, isStandart:Boolean = true)
        {
            super(mediaType);
            _mediaType = mediaType;
            _isStandart = isStandart;
        }
        
        private var _isStandart:Boolean;
        private var _mediaType:MediaType;
        
        public function get isStandart():Boolean
        {
            return _isStandart;
        }
        
        public function get mediaType():MediaType
        {
            return _mediaType;
        }
    }
}

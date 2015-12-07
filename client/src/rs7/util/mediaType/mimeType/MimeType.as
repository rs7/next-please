package rs7.util.mediaType.mimeType
{
    import rs7.lang.enum.Enum;
    
    public class MimeType extends Enum
    {
        public static const AMF:MimeType = new MimeType(MimeTypeBasicType.APPLICATION, MimeTypeSubType.AMF);
        
        public function MimeType(basicType:MimeTypeBasicType, subType:MimeTypeSubType)
        {
            super(basicType, subType);
            _basicType = basicType;
            _subType = subType;
        }
        
        private var _basicType:MimeTypeBasicType;
        private var _subType:MimeTypeSubType;
        
        public function get basicType():MimeTypeBasicType
        {
            return _basicType;
        }
        
        public function get subType():MimeTypeSubType
        {
            return _subType;
        }
    }
}

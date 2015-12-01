package rs7.util.mediaType.mimeType
{
    import rs7.lang.enum.Enum;
    
    public class MimeType extends Enum
    {
        public static const AMF:MimeType = new MimeType(MimeTypeBasicType.APPLICATION, MimeTypeSubType.AMF);
        
        public function MimeType(basicType:MimeTypeBasicType, subType:MimeTypeSubType)
        {
            super(null);//TODO
        }
    }
}

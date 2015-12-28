package rs7.lang.enum
{
    use namespace enum_internal;
    
    public class Enum
    {
        public function Enum(...keyParts)
        {
            key = EnumKeyCreator.instance.createKey.apply(null, keyParts);
        }
        
        enum_internal var key:EnumKey;
    }
}

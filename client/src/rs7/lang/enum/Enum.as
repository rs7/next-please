package rs7.lang.enum
{
    public class Enum
    {
        public function Enum(value:*)
        {
            _key = EnumKeyCreator.createKey(value);
        }
        
        private var _key:*;
        
        enum_internal function get key():*
        {
            return _key;
        }
    }
}

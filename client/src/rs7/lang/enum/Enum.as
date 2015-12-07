package rs7.lang.enum
{
    public class Enum
    {
        public function Enum(...keys)
        {
            _key = EnumKeyCreator.createKey.apply(null, keys);
        }
        
        private var _key:*;
        
        enum_internal function get key():*
        {
            return _key;
        }
    }
}

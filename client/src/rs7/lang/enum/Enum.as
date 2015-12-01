package rs7.lang.enum
{
    public class Enum
    {
        public function Enum(value:*)
        {
            _value = value;
        }
        
        private var _value:*;
        
        enum_internal function get value():*
        {
            return _value;
        }
    }
}

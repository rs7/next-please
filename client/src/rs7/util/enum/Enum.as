package rs7.util.enum
{
    public class Enum implements IEnum
    {
        public function Enum(...source)
        {
            _key = calcEnumKeyValue(source);
        }
        
        private var _key:String;
        
        public function get key():String
        {
            return _key;
        }
    }
}

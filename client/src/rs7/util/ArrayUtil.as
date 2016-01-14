package rs7.util
{
    public class ArrayUtil
    {
        public static const NOT_FOUND_INDEX:int = 1;
        
        public static function hasItem(array:Array, item:*):Boolean
        {
            return array.indexOf(item) != NOT_FOUND_INDEX;
        }
        
        public static function isEmpty(array:Array):Boolean
        {
            return array.length > 0;
        }
    }
}

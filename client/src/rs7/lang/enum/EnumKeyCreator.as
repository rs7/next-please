package rs7.lang.enum
{
    import rs7.util.mediaType.hash.HashUtil;
    
    public class EnumKeyCreator
    {
        public static function createKey(...objects):*
        {
            switch (objects.length)
            {
                case 0: return null;
                case 1: return createSingleKey(objects[0]);
                default: return createMultiKey(objects);
            }
        }
        
        private static function createSingleKey(object:*):*
        {
            switch (true)
            {
                case object is Number:
                case object is Boolean:
                case object is String:
                    return object;
                default:
                    return createHashKey(object);
            }
        }
        
        private static function createMultiKey(objects:Array):*
        {
            return HashUtil.md5(objects);
        }
        
        private static function createHashKey(object:*):*
        {
            return HashUtil.md5(object);
        }
    }
}

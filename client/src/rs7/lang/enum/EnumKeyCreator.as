package rs7.lang.enum
{
    use namespace enum_internal;
    
    internal class EnumKeyCreator
    {
        public static const instance:EnumKeyCreator = new EnumKeyCreator();
        
        public function createKey(...source):EnumKey
        {
            var key:EnumKey = new EnumKey();
            
            switch (source.length)
            {
                case 0:
                    key.stringKey = null;
                    break;
                case 1:
                    key.stringKey = createSingleKey(source[0]);
                    break;
                default:
                    key.stringKey = createMultiKey(source);
                    break;
            }
            
            return key;
        }
        
        private function createMultiKey(source:Array):String
        {
            return source.filter(
                function (sourceItem:*, ..._) : String
                {
                    return createSingleKey(sourceItem);
                }
            ).join(",");
        }
        
        private function createSingleKey(source:*):String
        {
            switch (true)
            {
                case source is String:
                    return source;
                case source is Number:
                case source is Boolean:
                    return String(source);
                case source is Enum:
                    return Enum(source).key.stringKey;
                case source is Object:
                    return Object(source).toString();
                default:
                    throw new Error("Invalid type of part of enum key");
            }
        }
    }
}

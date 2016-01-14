package rs7.util.enum
{
    import org.spicefactory.lib.reflect.ClassInfo;
    import org.spicefactory.lib.reflect.Property;
    
    import rs7.util.map.IMap;
    import rs7.util.map.Map;
    
    public class EnumHelper implements IEnumHelper
    {
        private var map:IMap = new Map();
        
        public function initializeClass(enumClass:Class):void
        {
            var classInfo:ClassInfo = ClassInfo.forClass(enumClass);
            var staticProperties:Array = classInfo.getStaticProperties();
            
            var enumValueMap:IMap = new Map();
            
            for each (var staticProperty:Property in staticProperties)
            {
                if (staticProperty.type == classInfo)
                {
                    var enum:IEnum = staticProperty.getValue(null);
                    
                    if (enumValueMap.getValue(enum.key))
                    {
                        throw new Error("Duplicate enum key");
                    }
                    
                    enumValueMap.setValue(enum.key, enum);
                }
            }
            
            map.setValue(enumClass.toString(), enumValueMap);
        }
        
        private function initializeClassIfNeed(clazz:Class):void
        {
            if (!map.getValue(clazz.toString()))
            {
                initializeClass(clazz);
            }
        }
        
        public function valueOf(clazz:Class, key:String):IEnum
        {
            initializeClassIfNeed(clazz);
            
            return IMap(map.getValue(clazz.toString())).getValue(key);
        }
        
        public function values(clazz:Class):Array
        {
            initializeClassIfNeed(clazz);
            
            return IMap(map.getValue(clazz.toString())).values();
        }
    }
}

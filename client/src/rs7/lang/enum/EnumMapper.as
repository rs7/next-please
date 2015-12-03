package rs7.lang.enum
{
    import flash.utils.Dictionary;
    
    import org.spicefactory.lib.reflect.ClassInfo;
    import org.spicefactory.lib.reflect.Property;
    
    use namespace enum_internal;
    
    public class EnumMapper
    {
        public static const instance:EnumMapper = new EnumMapper();
        
        private var enumMap:Dictionary = new Dictionary();
        
        public function getEnum(enumClass:Class, enumValue:*):Enum
        {
            if (!enumMap[enumClass])
            {
                initializeEnumMap(enumClass);
            }
            
            return enumMap[enumClass][enumValue] as Enum;
        }
        
        private function initializeEnumMap(enumClass:Class):void
        {
            var classInfo:ClassInfo = ClassInfo.forClass(enumClass);
            var staticProperties:Array = classInfo.getStaticProperties();
            
            var enumValueMap:Dictionary = new Dictionary();
            
            for each (var staticProperty:Property in staticProperties)
            {
                if (staticProperty.type == classInfo)
                {
                    var enumItem:Enum = staticProperty.getValue(null);
                    
                    if (enumValueMap[enumItem.key])
                    {
                        throw new Error("Duplicate enum key");
                    }
                    
                    enumValueMap[enumItem.key] = enumItem;
                }
            }
            
            enumMap[enumClass] = enumValueMap;
        }
    }
}

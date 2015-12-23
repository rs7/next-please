package rs7.lang.enum
{
    import flash.utils.Dictionary;
    
    import org.spicefactory.lib.reflect.ClassInfo;
    import org.spicefactory.lib.reflect.Property;
    
    use namespace enum_internal;
    
    public class EnumMapper
    {
        public static const instance:EnumMapper = new EnumMapper();
        
        private var enumClassMap:Dictionary = new Dictionary();
        
        public function getEnum(enumClass:Class, enumValue:*):Enum
        {
            if (!enumClassMap[enumClass])
            {
                initializeEnumClass(enumClass);
            }
            
            return enumClassMap[enumClass][enumValue] as Enum;
        }
        
        public function initializeEnumClass(enumClass:Class):void
        {
            var classInfo:ClassInfo = ClassInfo.forClass(enumClass);
            var staticProperties:Array = classInfo.getStaticProperties();
            
            var enumValueMap:Dictionary = new Dictionary();
            
            for each (var staticProperty:Property in staticProperties)
            {
                if (staticProperty.type == classInfo)
                {
                    var enumItem:Enum = staticProperty.getValue(null);
                    
                    var enumKey:EnumKey = enumItem.key;
                    var enumStringKey:String = enumKey.stringKey;
                    
                    if (enumValueMap[enumStringKey])
                    {
                        throw new Error("Duplicate enum key");
                    }
                    
                    enumValueMap[enumStringKey] = enumItem;
                }
            }
            
            enumClassMap[enumClass] = enumValueMap;
        }
    }
}

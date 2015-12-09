package rs7.entity
{
    import org.spicefactory.lib.reflect.ClassInfo;
    
    public class EntityIdentifier
    {
        public static function createForNewInstance(instance:Entity):EntityIdentifier
        {
            var classInfo:ClassInfo = ClassInfo.forInstance(instance);
            
            var entityIdentifier:EntityIdentifier = new EntityIdentifier(classInfo.getClass(), null);
            
            return entityIdentifier;
        }
        
        public function EntityIdentifier(clazz:Class, id:*)
        {
            _clazz = clazz;
            _id = id;
        }
        
        private var _clazz:Class;
        private var _id:*;
        
        public function get clazz():Class
        {
            return _clazz;
        }
        
        public function get id():*
        {
            return _id;
        }
        
        public function set id(value:*):void
        {
            _id = value;
        }
    }
}

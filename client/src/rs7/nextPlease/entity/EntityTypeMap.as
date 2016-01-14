package rs7.nextPlease.entity
{
    import rs7.util.enum.IEnumHelper;
    
    public class EntityTypeMap
    {
        [Inject]
        public var enumHelper:IEnumHelper;
        
        public function getEntityType(name:String):EntityType
        {
            return EntityType(enumHelper.valueOf(EntityType, name));
        }
    }
}

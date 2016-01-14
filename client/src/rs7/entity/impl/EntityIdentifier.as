package rs7.entity.impl
{
    import rs7.nextPlease.entity.api.IEntityIdentifier;
    import rs7.nextPlease.entity.api.IEntityType;
    
    public class EntityIdentifier implements IEntityIdentifier
    {
        public function EntityIdentifier(type:IEntityType, id:*)
        {
            _id = id;
            _type = type;
        }
        
        private var _id:*;
        private var _type:IEntityType;
        
        public function get id():*
        {
            return _id;
        }
        
        public function get type():IEntityType
        {
            return _type;
        }
    }
}

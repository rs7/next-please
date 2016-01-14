package rs7.entity.impl
{
    import rs7.nextPlease.entity.api.IEntity;
    import rs7.nextPlease.entity.api.IEntityIdentifier;
    
    public class Entity implements IEntity
    {
        public function Entity(id:IEntityIdentifier)
        {
            _id = id;
        }
        
        private var _id:IEntityIdentifier;
        
        public function get id():IEntityIdentifier
        {
            return _id;
        }
    }
}

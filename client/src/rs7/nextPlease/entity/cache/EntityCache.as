package rs7.nextPlease.entity.cache
{
    import rs7.nextPlease.entity.api.IEntity;
    import rs7.nextPlease.entity.api.IEntityCache;
    import rs7.nextPlease.entity.api.IEntityIdentifier;
    import rs7.util.map.IMap;
    import rs7.util.map.Map;
    
    public class EntityCache implements IEntityCache
    {
        private var map:IMap = new Map();
        
        public function getEntity(identifier:IEntityIdentifier):IEntity
        {
            return map.getValue(identifier.id);
        }
        
        public function setEntity(identifier:IEntityIdentifier, entity:IEntity):void
        {
            map.setValue(identifier.id, entity);
        }
    }
}

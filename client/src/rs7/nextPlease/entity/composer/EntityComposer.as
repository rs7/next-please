package rs7.nextPlease.entity.composer
{
    import robotlegs.bender.framework.api.IInjector;
    
    import rs7.nextPlease.entity.api.IEntityIdentifier;
    
    import rs7.nextPlease.entity.api.IApplicationEntity;
    import rs7.nextPlease.entity.api.IEntityCache;
    
    public class EntityComposer
    {
        [Inject]
        public var cache:IEntityCache;
        
        [Inject]
        public var injector:IInjector;
        
        public function getEntity(identifier:IEntityIdentifier):IApplicationEntity
        {
            return getCacheEntity(identifier) || createEntity(identifier);
        }
        
        private function createEntity(identifier:EntityIdentifier):IApplicationEntity
        {
            var entity:IApplicationEntity = injector.getInstance(identifier.type.clazz);
            cache.setEntity(identifier, entity);
            return entity;
        }
        
        private function getCacheEntity(identifier:EntityIdentifier):IApplicationEntity
        {
            return cache.getEntity(identifier);
        }
        
        private function populateEntity():void
        {
            
        }
    }
}

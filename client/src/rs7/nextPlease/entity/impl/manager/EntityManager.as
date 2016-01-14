package rs7.nextPlease.entity.impl.manager
{
    import com.codecatalyst.promise.Promise;
    
    import rs7.nextPlease.entity.api.IEntityIdentifier;
    
    import rs7.nextPlease.entity.api.manager.IEntityManager;
    import rs7.robotlegs.bender.extensions.promiseCommand.api.IPromiseCommandMap;
    
    public class EntityManager implements IEntityManager
    {
        [Inject]
        public var promiseCommandMap:IPromiseCommandMap;
        
        public function getEntity(identifier:IEntityIdentifier):Promise
        {
            return null;
        }
    }
}

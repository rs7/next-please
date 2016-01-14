package rs7.nextPlease.entity.api.manager
{
    import com.codecatalyst.promise.Promise;
    
    import rs7.nextPlease.entity.api.IEntityIdentifier;
    
    public interface IEntityManager
    {
        function getEntity(identifier:IEntityIdentifier):Promise;
    }
}

package rs7.entity.api.manager
{
    import rs7.nextPlease.entity.api.IEntity;
    import rs7.nextPlease.entity.api.IEntityIdentifier;
    import rs7.nextPlease.entity.api.IEntityType;
    
    public interface IEntityManager
    {
        function create(type:IEntityType):IEntityCreateResult;
        
        function fetch(id:IEntityIdentifier):IEntityFetchResult;
        
        function remove(id:IEntityIdentifier):IEntityRemoveResult;
        
        function save(entity:IEntity):IEntitySaveResult;
    }
}

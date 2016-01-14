package rs7.nextPlease.entity.api
{
    public interface IEntityCache
    {
        function getEntity(identifier:IEntityIdentifier):IEntity;
        
        function setEntity(entity:IEntity):void;
    }
}

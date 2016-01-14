package rs7.nextPlease.entity.api
{
    public interface IEntityIdentifier
    {
        function get id():*;
        
        function get type():IEntityType;
    }
}

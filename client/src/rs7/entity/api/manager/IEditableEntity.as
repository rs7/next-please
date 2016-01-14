package rs7.entity.api.manager
{
    import rs7.entity.api.*;
    import rs7.entity.api.manager.IEntitySaveResult;
    
    public interface IEditableEntity extends IReadOnlyEntity
    {
        function get isChanged():Boolean;
        
        function reset():void;
        
        function save():IEntitySaveResult;
    }
}

package rs7.entity.api.manager
{
    import rs7.util.async.IAsyncResult;
    import rs7.entity.api.manager.IEditableEntity;
    import rs7.entity.api.manager.IReadOnlyEntity;
    
    public interface IEntityGetResult extends IAsyncResult
    {
        function getEditable():IEditableEntity;
        
        function getReadOnly():IReadOnlyEntity;
    }
}

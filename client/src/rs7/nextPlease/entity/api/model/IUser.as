package rs7.nextPlease.entity.api.model
{
    import mx.collections.ArrayCollection;
    
    public interface IUser
    {
        [ArrayElementType(elementType="rs7.nextPlease.entity.api.model.IChange")] 
        function get changes():ArrayCollection;
        
        function get name():String;
        
        function get photoURL():String;
    }
}

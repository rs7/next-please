package rs7.nextPlease.entity.impl.model
{
    import mx.collections.ArrayCollection;
    
    import rs7.nextPlease.entity.api.model.IUser;
    
    [Bindable]
    public class User implements IUser
    {
        [ArrayElementType(elementType="rs7.nextPlease.entity.api.model.IChange")]
        public var changes:ArrayCollection;
        
        public var name:String;
        
        public var photoURL:String;
    }
}

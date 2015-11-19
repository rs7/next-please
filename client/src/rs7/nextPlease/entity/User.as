package rs7.nextPlease.entity
{
    import mx.collections.ArrayCollection;
    
    [Bindable]
    [RemoteClass(alias="np.entity.User")]
    public class User
    {
        public var changes:ArrayCollection;
        public var id:int;
        public var name:String;
        public var photoURL:String;
    }
}

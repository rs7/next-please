package rs7.nextPlease.entity
{
    [Bindable]
    [RemoteClass(alias="np.entity.User")]
    public class User
    {
        public var id:int;
        public var name:String;
        public var photoURL:String;
    }
}

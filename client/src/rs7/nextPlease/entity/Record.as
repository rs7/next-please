package rs7.nextPlease.entity
{
    [Bindable]
    [RemoteClass(alias="np.entity.Record")]
    public class Record
    {
        public var date:Date;
        public var id:int;
        public var user:User;
    }
}

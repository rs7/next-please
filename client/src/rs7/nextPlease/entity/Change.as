package rs7.nextPlease.entity
{
    [Bindable]
    [RemoteClass(alias="np.entity.Change")]
    public class Change
    {
        public var date:Date;
        public var id:int;
        public var relation:Relation;
        public var user:User;
    }
}
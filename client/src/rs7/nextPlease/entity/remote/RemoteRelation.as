package rs7.nextPlease.entity.remote
{
    import rs7.nextPlease.entity.api.IRemoteEntity;
    
    [RemoteClass(alias="np.entity.Relation")]
    [RemoteEntity("relation")]
    public class RemoteRelation implements IRemoteEntity
    {
        [Id]
        public var id:int;
        
        public var titleKey:String;
    }
}

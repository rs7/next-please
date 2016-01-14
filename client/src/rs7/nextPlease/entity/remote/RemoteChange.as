package rs7.nextPlease.entity.remote
{
    import rs7.nextPlease.entity.api.IRemoteEntity;
    
    [RemoteClass(alias="np.entity.Change")]
    [RemoteEntity("change")]
    public class RemoteChange implements IRemoteEntity
    {
        public var date:Date;
        
        [Id]
        public var id:int;
        
        [EntityId("relation")]
        public var relationId:int;
        
        [EntityId("user")]
        public var userId:int;
    }
}

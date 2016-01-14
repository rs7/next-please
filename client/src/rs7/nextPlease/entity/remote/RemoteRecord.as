package rs7.nextPlease.entity.remote
{
    import rs7.nextPlease.entity.api.IRemoteEntity;
    
    [RemoteClass(alias="np.entity.Record")]
    [RemoteEntity("record")]
    public class RemoteRecord implements IRemoteEntity
    {
        public var date:Date;
        
        [Id]
        public var id:int;
        
        [EntityId("recordBook")]
        public var recordBookId:int;
        
        [EntityId("user")]
        public var userId:int;
    }
}

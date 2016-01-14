package rs7.nextPlease.entity.remote
{
    import rs7.nextPlease.entity.api.IRemoteEntity;
    
    [RemoteClass(alias="np.entity.RecordBook")]
    [RemoteEntity("recordBook")]
    public class RemoteRecordBook implements IRemoteEntity
    {
        [Id]
        public var id:int;
        
        public var titleKey:String;
    }
}

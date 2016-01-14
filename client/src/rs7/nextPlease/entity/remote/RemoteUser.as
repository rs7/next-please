package rs7.nextPlease.entity.remote
{
    import rs7.nextPlease.entity.api.IRemoteEntity;
    
    [RemoteClass(alias="np.entity.User")]
    [RemoteEntity("user")]
    public class RemoteUser implements IRemoteEntity
    {
        [Id]
        public var id:int;
    }
}

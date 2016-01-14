package rs7.nextPlease.entity.remote.metadata
{
    import org.spicefactory.lib.reflect.ClassInfo;
    import org.spicefactory.lib.reflect.Metadata;
    
    [Metadata(name="RemoteEntity", types="class")]
    public class RemoteEntityMetadata
    {
        {
            Metadata.registerMetadataClass(RemoteEntityMetadata);
        }
        
        [DefaultProperty]
        public var type:ClassInfo;
    }
}

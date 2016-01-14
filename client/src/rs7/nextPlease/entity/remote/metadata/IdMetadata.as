package rs7.nextPlease.entity.remote.metadata
{
    import org.spicefactory.lib.reflect.ClassInfo;
    import org.spicefactory.lib.reflect.Metadata;
    
    [Metadata(name="Id", types="property")]
    public class IdMetadata
    {
        {
            Metadata.registerMetadataClass(IdMetadata);
        }
        
        [DefaultProperty]
        public var type:ClassInfo;
    }
}

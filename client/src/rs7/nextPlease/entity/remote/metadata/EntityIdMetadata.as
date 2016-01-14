package rs7.nextPlease.entity.remote.metadata
{
    import org.spicefactory.lib.reflect.ClassInfo;
    import org.spicefactory.lib.reflect.Metadata;
    
    [Metadata(name="EntityId", types="property")]
    public class EntityIdMetadata
    {
        {
            Metadata.registerMetadataClass(EntityIdMetadata);
        }
        
        [DefaultProperty]
        public var type:ClassInfo;
    }
}

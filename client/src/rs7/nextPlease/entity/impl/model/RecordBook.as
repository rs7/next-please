package rs7.nextPlease.entity.impl.model
{
    import mx.collections.ArrayCollection;
    
    import rs7.nextPlease.entity.api.model.IRecordBook;
    
    [Bindable]
    public class RecordBook implements IRecordBook
    {
        [ArrayElementType(elementType="rs7.nextPlease.entity.api.model.IRecord")]
        public var records:ArrayCollection;
        
        public var titleKey:String;
    }
}

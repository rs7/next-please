package rs7.nextPlease.entity.api.model
{
    import mx.collections.ArrayCollection;
    
    public interface IRecordBook
    {
        [ArrayElementType(elementType="rs7.nextPlease.entity.api.model.IRecord")]
        function get records():ArrayCollection;
        
        function get titleKey():String;
    }
}

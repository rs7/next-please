package rs7.nextPlease.model
{
    import mx.collections.ArrayCollection;
    
    [Bindable]
    public class Model
    {
        public static const RECORDS_UPDATE_EVENT_TYPE:String = "recordsUpdate";
        
        public var records:ArrayCollection;
    }
}

package rs7.nextPlease.model
{
    import mx.collections.ArrayCollection;
    
    import rs7.nextPlease.signal.RecordsUpdateSignal;
    
    [Bindable]
    public class Model
    {
        private var _records:ArrayCollection;
        
        [Inject]
        public var recordsUpdateSignal:RecordsUpdateSignal;
        
        public function get records():ArrayCollection
        {
            return _records;
        }
        
        public function set records(value:ArrayCollection):void
        {
            _records = value;
            recordsUpdateSignal.dispatch();
        }
    }
}

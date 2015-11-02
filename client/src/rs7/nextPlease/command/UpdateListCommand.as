package rs7.nextPlease.command
{
    import flash.events.Event;
    import flash.events.IEventDispatcher;
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    
    import mx.collections.ArrayCollection;
    
    import robotlegs.bender.bundles.mvcs.Command;
    import robotlegs.bender.framework.api.IContext;
    
    import rs7.nextPlease.model.Model;
    
    public class UpdateListCommand extends Command
    {
        [Inject]
        public var context:IContext;
        
        [Inject]
        public var eventDispatcher:IEventDispatcher;
        
        [Inject]
        public var model:Model;
        
        override public function execute():void
        {
            context.detain(this);
            
            var request:URLRequest = new URLRequest("http://localhost:8090/record-book/1/records.amf");
            var loader:URLLoader = new URLLoader();
            loader.addEventListener(Event.COMPLETE, loader_completeHandler);
            loader.dataFormat = URLLoaderDataFormat.BINARY;
            loader.load(request);
        }
        
        private function release():void
        {
            context.release(this);
        }
        
        private function loader_completeHandler(event:Event):void
        {
            var loader:URLLoader = URLLoader(event.currentTarget);
            var records:ArrayCollection = ArrayCollection(ByteArray(loader.data).readObject());
            model.records = records;
            
            eventDispatcher.dispatchEvent(new Event(Model.RECORDS_UPDATE_EVENT_TYPE));
            
            release();
        }
    }
}

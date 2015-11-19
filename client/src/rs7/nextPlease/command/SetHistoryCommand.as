package rs7.nextPlease.command
{
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    
    import mx.collections.ArrayCollection;
    import mx.utils.StringUtil;
    
    import robotlegs.bender.bundles.mvcs.Command;
    import robotlegs.bender.framework.api.IContext;
    
    import rs7.nextPlease.entity.Record;
    import rs7.nextPlease.entity.User;
    import rs7.nextPlease.model.Model;
    
    public class SetHistoryCommand extends Command
    {
        [Inject]
        public var context:IContext;
        
        private var inProgress:int;
        
        [Inject]
        public var model:Model;
        
        override public function execute():void
        {
            context.detain(this);
            
            inProgress = 0;
            for each(var record:Record in model.records)
            {
                inProgress++;
                updateOne(record.user);
            }
        }
        
        private function release():void
        {
            context.release(this);
        }
        
        private function updateOne(user:User):void
        {
            var request:URLRequest = new URLRequest(
                StringUtil.substitute(
                    "http://localhost:8090/user/{0}/changes.amf", user.id
                )
            );
            var loader:URLLoader = new URLLoader();
            loader.addEventListener(Event.COMPLETE, loader_completeHandler);
            loader.dataFormat = URLLoaderDataFormat.BINARY;
            loader.load(request);
            
            function loader_completeHandler(event:Event):void
            {
                var loader:URLLoader = URLLoader(event.currentTarget);
                var changes:ArrayCollection = ArrayCollection(ByteArray(loader.data).readObject());
                user.changes = changes;
                if (inProgress == 0)
                {
                    release();
                }
            }
        }
    }
}

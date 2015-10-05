package rs7.nextPlease.command
{
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    
    import robotlegs.bender.bundles.mvcs.Command;
    import robotlegs.bender.framework.api.IContext;
    
    import rs7.nextPlease.entity.Record;
    import rs7.nextPlease.model.Model;
    
    public class SetVKInfoUserCommand extends Command
    {
        [Inject]
        public var context:IContext;
        
        [Inject]
        public var model:Model;
        
        override public function execute():void
        {
            context.detain(this);
            
            var userIDs:Array = [];
            for each(var record:Record in model.records)
            {
                userIDs.push(record.user.id);
            }
            
            var request:URLRequest = new URLRequest("http://api.vk.com/method/users.get.xml?user_ids=" + userIDs.join(",") + "&fields=photo_100");
            var loader:URLLoader = new URLLoader();
            loader.addEventListener(Event.COMPLETE, loader_completeHandler);
            loader.load(request);
        }
        
        private function release():void
        {
            context.release(this);
        }
        
        private function loader_completeHandler(event:Event):void
        {
            var loader:URLLoader = URLLoader(event.currentTarget);
            var response:XML = XML(loader.data);
            
            for each(var record:Record in model.records)
            {
                var searchResult:XMLList = response.user.(uid == record.user.id);
                
                if (searchResult.length() == 0)
                {
                    continue;
                }
                
                var userXML:XML = searchResult[0];
                record.user.name = userXML.first_name + " " + userXML.last_name;
                record.user.photoURL = userXML.photo_100;
            }
            
            release();
        }
    }
}

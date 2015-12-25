package rs7.nextPlease.command
{
    import mx.utils.StringUtil;
    
    import robotlegs.bender.bundles.mvcs.Command;
    import robotlegs.bender.framework.api.IContext;
    
    import rs7.http.loader.IHTTPLoader;
    import rs7.http.method.HTTPMethod;
    import rs7.http.promise.IHTTPPromise;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.uri.URI;
    import rs7.nextPlease.entity.Record;
    import rs7.nextPlease.model.Model;
    
    public class SetVKInfoUserCommand extends Command
    {
        [Inject]
        public var context:IContext;
        
        [Inject]
        public var loader:IHTTPLoader;
        
        [Inject]
        public var model:Model;
        
        [Inject]
        public var request:IHTTPRequest;
        
        override public function execute():void
        {
            context.detain(this);
            
            var userIDs:Array = [];
            for each(var record:Record in model.records)
            {
                userIDs.push(record.user.id);
            }
            
            request.method = HTTPMethod.GET;
            request.uri = new URI(
                StringUtil.substitute(
                    "http://api.vk.com/method/users.get.xml?user_ids={0}&fields=photo_100",
                    userIDs.join(",")
                )
            );
            
            var promise:IHTTPPromise = loader.load(request);
            
            promise.success.addOnce(onSuccess);
            
            function onSuccess():void
            {
                var response:XML = XML(promise.response.body.readUTFBytes(promise.response.body.bytesAvailable));
                
                for each(var record:Record in model.records)
                {
                    var searchResult:XMLList = response.user.(uid == record.user.id);
                    
                    if (searchResult.length() == 0)
                    {
                        continue;
                    }
                    
                    var userXML:XML = searchResult[0];
                    record.user.name = StringUtil.substitute("{0} {1}", userXML.first_name, userXML.last_name);
                    record.user.photoURL = userXML.photo_100;
                }
                release();
            }
        }
        
        private function release():void
        {
            context.release(this);
        }
    }
}

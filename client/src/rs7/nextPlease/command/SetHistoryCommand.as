package rs7.nextPlease.command
{
    import mx.collections.ArrayCollection;
    import mx.utils.StringUtil;
    
    import robotlegs.bender.bundles.mvcs.Command;
    import robotlegs.bender.framework.api.IContext;
    
    import rs7.http.loader.IHTTPLoader;
    import rs7.http.loader.IHTTPLoaderCreator;
    import rs7.http.method.HTTPMethod;
    import rs7.http.promise.IHTTPPromise;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.request.IHTTPRequestCreator;
    import rs7.http.uri.URI;
    import rs7.nextPlease.entity.Record;
    import rs7.nextPlease.entity.User;
    import rs7.nextPlease.model.Model;
    
    public class SetHistoryCommand extends Command
    {
        [Inject]
        public var context:IContext;
        
        private var inProgress:int;
        
        [Inject]
        public var loaderCreator:IHTTPLoaderCreator;
        
        [Inject]
        public var model:Model;
        
        [Inject]
        public var requestCreator:IHTTPRequestCreator;
        
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
            var request:IHTTPRequest = requestCreator.create();
            
            request.method = HTTPMethod.GET;
            request.uri = new URI(StringUtil.substitute("http://localhost:8090/user/{0}/changes.amf", user.id));
            
            var loader:IHTTPLoader = loaderCreator.create();
            
            var promise:IHTTPPromise = loader.load(request);
            
            promise.success.addOnce(onSuccess);
            
            function onSuccess():void
            {
                var changes:ArrayCollection = ArrayCollection(promise.response.body.readObject());
                user.changes = changes;
                if (inProgress == 0)
                {
                    release();
                }
            }
        }
    }
}

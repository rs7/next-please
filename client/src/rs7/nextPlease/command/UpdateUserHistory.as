package rs7.nextPlease.command
{
    import mx.collections.ArrayCollection;
    import mx.utils.StringUtil;
    
    import robotlegs.bender.bundles.mvcs.Command;
    import robotlegs.bender.framework.api.IContext;
    
    import rs7.http.loader.IHTTPLoader;
    import rs7.http.method.HTTPMethod;
    import rs7.http.promise.IHTTPPromise;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.uri.URI;
    import rs7.nextPlease.entity.User;
    
    public class UpdateUserHistory extends Command
    {
        [Inject]
        public var context:IContext;
        
        [Inject]
        public var loader:IHTTPLoader;
        
        [Inject]
        public var request:IHTTPRequest;
        
        [Inject]
        public var user:User;
        
        override public function execute():void
        {
            context.detain(this);
            
            request.method = HTTPMethod.GET;
            request.uri = new URI(StringUtil.substitute("http://localhost:8090/user/{0}/changes.amf", user.id));
            
            var promise:IHTTPPromise = loader.load(request);
            
            promise.success.addOnce(onSuccess);
            
            function onSuccess():void
            {
                var changes:ArrayCollection = ArrayCollection(promise.response.body.readObject());
                user.changes = changes;
                release();
            }
        }
        
        private function release():void
        {
            context.release(this);
        }
    }
    
}

package rs7.nextPlease.command
{
    import mx.collections.ArrayCollection;
    
    import robotlegs.bender.bundles.mvcs.Command;
    import robotlegs.bender.framework.api.IContext;
    
    import rs7.http.loader.IHTTPLoader;
    import rs7.http.method.HTTPMethod;
    import rs7.http.promise.IHTTPPromise;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.uri.URI;
    import rs7.nextPlease.model.Model;
    
    public class UpdateListCommand extends Command
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
            
            request.method = HTTPMethod.GET;
            request.uri = new URI("http://localhost:8090/record-book/1/records.amf");
            
            var promise:IHTTPPromise = loader.load(request);
            
            promise.success.addOnce(onSuccess);
            
            function onSuccess():void
            {
                var records:ArrayCollection = ArrayCollection(promise.response.body.readObject());
                model.records = records;
                release();
            }
        }
        
        private function release():void
        {
            context.release(this);
        }
    }
}

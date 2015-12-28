package rs7.nextPlease.command
{
    import rs7.http.loader.IHTTPLoader;
    import rs7.http.promise.IHTTPPromise;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.response.IHTTPResponse;
    import rs7.lang.abstract.AbstractMethodError;
    import rs7.robotlegs.AsyncCommand;
    
    public class HTTPCommand extends AsyncCommand
    {
        private var loader:IHTTPLoader;
        
        private var request:IHTTPRequest;
        
        override public function execute():void
        {
            detain();
            
            initRequest(request);
            
            var promise:IHTTPPromise = loader.load(request);
            
            promise.success.addOnce(onSuccessHandler);
            promise.fail.addOnce(onFailHandler);
        }
        
        protected function initRequest(request:IHTTPRequest):void
        {
            throw new AbstractMethodError();
        }
        
        [Inject]
        public final function initialize(loader:IHTTPLoader, request:IHTTPRequest):void
        {
            this.loader = loader;
            this.request = request;
        }
        
        protected function onFail(error:Error):void
        {
            //override in subclass if need
        }
        
        private function onFailHandler(error:Error):void
        {
            onFail(error);
            release();
        }
        
        protected function onSuccess(response:IHTTPResponse):void
        {
            //override in subclass if need
        }
        
        private function onSuccessHandler(response:IHTTPResponse):void
        {
            onSuccess(response);
            release();
        }
    }
}

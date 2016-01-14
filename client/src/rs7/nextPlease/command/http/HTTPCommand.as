package rs7.nextPlease.command.http
{
    import rs7.http.loader.IHTTPLoader;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.response.IHTTPResponse;
    import rs7.lang.abstract.AbstractMethodError;
    import rs7.robotlegs.bender.extensions.asyncCommand.impl.AsyncCommand;
    
    public class HTTPCommand extends AsyncCommand
    {
        [Inject]
        public var loader:IHTTPLoader;
        
        [Inject]
        public var request:IHTTPRequest;
        
        final override public function execute():void
        {
            detain();
            
            initRequest(request);
            
            loader.load(request).then(onSuccessHandler, onFailHandler);
        }
        
        protected function initRequest(request:IHTTPRequest):void
        {
            throw new AbstractMethodError();
        }
        
        protected function onFail(error:Error):void
        {
            //override in subclass if need
            throw error;
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

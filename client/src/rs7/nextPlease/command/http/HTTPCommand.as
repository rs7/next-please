package rs7.nextPlease.command.http
{
    import rs7.http.loader.IHTTPLoader;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.response.IHTTPResponse;
    import rs7.util.abstract.AbstractMethodError;
    import rs7.robotlegs.bender.extensions.promiseCommand.impl.PromiseCommand;
    
    public class HTTPCommand extends PromiseCommand
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
            reject(error);
        }
        
        private function onFailHandler(error:Error):void
        {
            onFail(error);
        }
        
        protected function onSuccess(response:IHTTPResponse):void
        {
            //override in subclass if need
            resolve(response);
        }
        
        private function onSuccessHandler(response:IHTTPResponse):void
        {
            onSuccess(response);
        }
    }
}

package rs7.http.loader
{
    import flash.events.ErrorEvent;
    import flash.events.Event;
    import flash.events.HTTPStatusEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.net.URLRequest;
    import flash.net.URLRequestHeader;
    import flash.net.URLRequestMethod;
    import flash.utils.ByteArray;
    
    import rs7.http.HTTPMethod;
    import rs7.http.HTTPResponseCreator;
    import rs7.http.IHTTPRequest;
    import rs7.http.header.HTTPHeader;
    import rs7.http.header.HTTPHeadersNames;
    import rs7.http.header.IHTTPHeader;
    import rs7.http.http_internal;
    import rs7.http.promise.HTTPPromise;
    import rs7.http.promise.IHTTPPromise;
    
    use namespace http_internal;
    
    public class HTTPLoader implements IHTTPLoader
    {
        private var _loader:URLLoader;
        private var _promise:HTTPPromise;
        private var _request:URLRequest;
        
        private function cleanupListeners():void
        {
            _loader.removeEventListener(Event.COMPLETE, loader_completeHandler);
            _loader.removeEventListener(IOErrorEvent.IO_ERROR, loader_ioErrorHandler);
            _loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, loader_securityErrorHandler);
            _loader.removeEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS, loader_httpResponseStatusHandler);
            _loader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, loader_httpStatusHandler);
        }
        
        private function fail():void
        {
            _promise.fail.dispatch();
        }
        
        public function load(request:IHTTPRequest):IHTTPPromise
        {
            _promise = new HTTPPromise();
            
            _request = new URLRequest();
            _request.url = request.uri.value;
            
            var requestHeaders:Array = [];
            
            switch (request.method)
            {
                case HTTPMethod.GET:
                    _request.method = URLRequestMethod.GET;
                    break;
                case HTTPMethod.POST:
                    _request.method = URLRequestMethod.POST;
                    break;
                case HTTPMethod.PUT:
                    _request.method = URLRequestMethod.POST;
                    requestHeaders.push(new HTTPHeader(HTTPHeadersNames.X_HTTP_METHOD_OVERRIDE, HTTPMethod.PUT.name));
                    break;
                case HTTPMethod.DELETE:
                    _request.method = URLRequestMethod.POST;
                    requestHeaders.push(new HTTPHeader(HTTPHeadersNames.X_HTTP_METHOD_OVERRIDE, HTTPMethod.DELETE.name));
                    break;
            }
            
            _request.requestHeaders = requestHeaders.filter(
                function convertHeader(httpHeader:IHTTPHeader, ..._):URLRequestHeader
                {
                    var urlRequestHeader:URLRequestHeader = new URLRequestHeader();
                    urlRequestHeader.name = httpHeader.name;
                    urlRequestHeader.value = httpHeader.value;
                    return urlRequestHeader;
                }
            );
            
            _request.data = request.body;
            
            _loader = new URLLoader();
            _loader.dataFormat = URLLoaderDataFormat.BINARY;
            
            try
            {
                _loader.load(_request);
            }
            catch (error:Error)
            {
                fail();
                return _promise;
            }
            
            _loader.addEventListener(Event.COMPLETE, loader_completeHandler);
            _loader.addEventListener(IOErrorEvent.IO_ERROR, loader_ioErrorHandler);
            _loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loader_securityErrorHandler);
            _loader.addEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS, loader_httpResponseStatusHandler);
            _loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, loader_httpStatusHandler);
            
            return _promise;
        }
        
        private function populateResponse():void
        {
            var responseCreator:HTTPResponseCreator = new HTTPResponseCreator();
            _promise.response = responseCreator.create(ByteArray(_loader.data));
        }
        
        private function success():void
        {
            populateResponse();
            _promise.success.dispatch();
        }
        
        private function loader_completeHandler(event:Event):void
        {
            cleanupListeners();
            success();
        }
        
        private function loader_errorHandler(event:ErrorEvent):void
        {
            cleanupListeners();
            fail();
        }
        
        private function loader_httpResponseStatusHandler(event:HTTPStatusEvent):void
        {
            loader_statusHandler(event);
        }
        
        private function loader_httpStatusHandler(event:HTTPStatusEvent):void
        {
            loader_statusHandler(event);
        }
        
        private function loader_ioErrorHandler(event:IOErrorEvent):void
        {
            loader_errorHandler(event);
        }
        
        private function loader_statusHandler(event:HTTPStatusEvent):void
        {
            
        }
        
        private function loader_securityErrorHandler(event:SecurityErrorEvent):void
        {
            loader_errorHandler(event);
        }
    }
}

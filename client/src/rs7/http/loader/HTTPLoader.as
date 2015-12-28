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
    
    import rs7.http.header.HTTPHeader;
    import rs7.http.header.HTTPHeaders;
    import rs7.http.header.HTTPHeadersNames;
    import rs7.http.header.IHTTPHeader;
    import rs7.http.http_internal;
    import rs7.http.method.HTTPMethod;
    import rs7.http.promise.HTTPPromise;
    import rs7.http.promise.IHTTPPromise;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.response.HTTPResponse;
    import rs7.http.status.HTTPStatus;
    import rs7.lang.enum.EnumMapper;
    import rs7.util.error.errorEventToError;
    
    use namespace http_internal;
    
    public class HTTPLoader implements IHTTPLoader
    {
        private var _loader:URLLoader;
        private var _promise:HTTPPromise;
        private var _request:URLRequest;
        private var _response:HTTPResponse;
        
        private function cleanupListeners():void
        {
            _loader.removeEventListener(Event.COMPLETE, loader_completeHandler);
            _loader.removeEventListener(IOErrorEvent.IO_ERROR, loader_ioErrorHandler);
            _loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, loader_securityErrorHandler);
            _loader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, loader_httpStatusHandler);
        }
        
        private function fail(error:Error):void
        {
            _promise.fail.dispatch(error);
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
                    requestHeaders.push(
                        new HTTPHeader(HTTPHeadersNames.X_HTTP_METHOD_OVERRIDE, HTTPMethod.DELETE.name)
                    );
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
                fail(error);
                return _promise;
            }
            
            _response = new HTTPResponse();
            
            _promise.http_internal::response = _response;
            
            _loader.addEventListener(Event.COMPLETE, loader_completeHandler);
            _loader.addEventListener(IOErrorEvent.IO_ERROR, loader_ioErrorHandler);
            _loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loader_securityErrorHandler);
            _loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, loader_httpStatusHandler);
            
            return _promise;
        }
        
        private function success():void
        {
            _response.http_internal::body = ByteArray(_loader.data);
            _promise.success.dispatch(_response);
        }
        
        private function loader_completeHandler(event:Event):void
        {
            cleanupListeners();
            success();
        }
        
        private function loader_errorHandler(event:ErrorEvent):void
        {
            cleanupListeners();
            fail(errorEventToError(event));
        }
        
        private function loader_httpStatusHandler(event:HTTPStatusEvent):void
        {
            _response.http_internal::status = HTTPStatus(EnumMapper.instance.getEnum(HTTPStatus, event.status));
            
            var headers:Array = [];
            
            if (event.hasOwnProperty("responseHeaders"))
            {
                headers = (
                    event["responseHeaders"] as Array
                ).filter(
                    function convertHeader(urlRequestHeader:URLRequestHeader, ..._):IHTTPHeader
                    {
                        var httpHeader:HTTPHeader = new HTTPHeader();
                        httpHeader.name = urlRequestHeader.name;
                        httpHeader.value = urlRequestHeader.value;
                        return httpHeader;
                    }
                );
            }
            
            _response.http_internal::headers = new HTTPHeaders(headers);
        }
        
        private function loader_ioErrorHandler(event:IOErrorEvent):void
        {
            loader_errorHandler(event);
        }
        
        private function loader_securityErrorHandler(event:SecurityErrorEvent):void
        {
            loader_errorHandler(event);
        }
    }
}

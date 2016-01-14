package rs7.http.loader
{
    import com.codecatalyst.promise.Deferred;
    import com.codecatalyst.promise.Promise;
    
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
    import rs7.http.request.IHTTPRequest;
    import rs7.http.response.HTTPResponse;
    import rs7.http.status.HTTPStatus;
    import rs7.util.enum.EnumHelper;
    import rs7.util.error.errorEventToError;
    
    use namespace http_internal;
    
    public class HTTPLoader implements IHTTPLoader
    {
        //запрещены загаловки: Accept-Charset, Accept-Encoding, Accept-Ranges, Age, Allow, Allowed, Authorization, Charge-To, Connect, Connection, Content-Length, Content-Location, Content-Range, Cookie, Date, Delete, ETag, Expect, Get, Head, Host, If-Modified-Since, Keep-Alive, Last-Modified, Location, Max-Forwards, Options, Origin, Post, Proxy-Authenticate, Proxy-Authorization, Proxy-Connection, Public, Put, Range, Referer, Request-Range, Retry-After, Server, TE, Trace, Trailer, Transfer-Encoding, Upgrade, URI, User-Agent, Vary, Via, Warning, WWW-Authenticate, x-flash-version,
        //todo: обработать запрещённые заголовки
        
        private var deferred:Deferred;
        private var loader:URLLoader;
        private var response:HTTPResponse;
        
        private function cleanupListeners():void
        {
            loader.removeEventListener(Event.COMPLETE, loader_completeHandler);
            loader.removeEventListener(IOErrorEvent.IO_ERROR, loader_ioErrorHandler);
            loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, loader_securityErrorHandler);
            loader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, loader_httpStatusHandler);
        }
        
        private function fail(error:Error):void
        {
            deferred.reject(error);
        }
        
        public function load(request:IHTTPRequest):Promise
        {
            deferred = new Deferred();
            
            var urlRequest:URLRequest = new URLRequest();
            urlRequest.url = request.uri.value;
            
            urlRequest.method = URLRequestMethod.POST;
            
            var requestHeaders:Array = request.headers.source;
            
            switch (request.method)
            {
                case HTTPMethod.DELETE:
                case HTTPMethod.GET:
                case HTTPMethod.PUT:
                    requestHeaders.push(new HTTPHeader(HTTPHeadersNames.X_HTTP_METHOD_OVERRIDE, request.method.name));
                    break;
            }
            
            urlRequest.requestHeaders = requestHeaders.map(
                function convertHeader(httpHeader:IHTTPHeader, ..._):URLRequestHeader
                {
                    return new URLRequestHeader(httpHeader.name, httpHeader.value);
                }
            );
            
            urlRequest.data = request.body;
            
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.BINARY;
            
            try
            {
                loader.load(urlRequest);
            }
            catch (error:Error)
            {
                fail(error);
                return deferred.promise;
            }
            
            response = new HTTPResponse();
            
            loader.addEventListener(Event.COMPLETE, loader_completeHandler);
            loader.addEventListener(IOErrorEvent.IO_ERROR, loader_ioErrorHandler);
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loader_securityErrorHandler);
            loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, loader_httpStatusHandler);
            
            return deferred.promise;
        }
        
        private function success():void
        {
            response.http_internal::body = ByteArray(loader.data);
            deferred.resolve(response);
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
            response.http_internal::status = HTTPStatus(EnumHelper.instance.getEnum(HTTPStatus, event.status));
            
            var headers:Array = [];
            
            if (event.hasOwnProperty("responseHeaders"))
            {
                headers = (
                    event["responseHeaders"] as Array
                ).map(
                    function convertHeader(urlRequestHeader:URLRequestHeader, ..._):IHTTPHeader
                    {
                        return new HTTPHeader(urlRequestHeader.name, urlRequestHeader.value);
                    }
                );
            }
            
            response.http_internal::headers = new HTTPHeaders(headers);
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

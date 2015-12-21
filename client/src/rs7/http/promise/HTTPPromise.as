package rs7.http.promise
{
    import org.osflash.signals.Promise;
    
    import rs7.http.HTTPResponse;
    import rs7.http.IHTTPResponse;
    import rs7.http.http_internal;
    
    use namespace http_internal;
    
    public class HTTPPromise implements IHTTPPromise
    {
        private var _fail:Promise = new Promise();
        http_internal var response:IHTTPResponse = new HTTPResponse();
        private var _success:Promise = new Promise();
        
        public function get fail():Promise
        {
            return _fail;
        }
        
        public function get response():IHTTPResponse
        {
            return http_internal::response;
        }
        
        public function get success():Promise
        {
            return _success;
        }
    }
}

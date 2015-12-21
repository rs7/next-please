package rs7.http
{
    import flash.utils.ByteArray;
    
    use namespace http_internal;
    
    public class HTTPResponseCreator
    {
        public function create(data:ByteArray, headers:Array):HTTPResponse
        {
            var response:HTTPResponse = new HTTPResponse();
            response.http_internal::body = data;
            return response;
        }
    }
}

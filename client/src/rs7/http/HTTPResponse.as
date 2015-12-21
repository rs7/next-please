package rs7.http
{
    import rs7.http.status.HTTPStatus;
    
    use namespace http_internal;
    
    public class HTTPResponse extends HTTPInputMessage implements IHTTPResponse
    {
        http_internal var status:HTTPStatus;
        
        public function get status():HTTPStatus
        {
            return http_internal::status;
        }
    }
}

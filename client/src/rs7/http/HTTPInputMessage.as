package rs7.http
{
    import flash.utils.ByteArray;
    import flash.utils.IDataInput;
    
    use namespace http_internal;
    
    public class HTTPInputMessage extends HTTPMessage implements IHTTPInputMessage
    {
        http_internal var body:IDataInput = new ByteArray();
        
        public function get body():IDataInput
        {
            return http_internal::body;
        }
    }
}

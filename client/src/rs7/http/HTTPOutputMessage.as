package rs7.http
{
    import flash.utils.ByteArray;
    import flash.utils.IDataOutput;
    
    public class HTTPOutputMessage extends HTTPMessage implements IHTTPOutputMessage
    {
        private var _body:ByteArray = new ByteArray();
        
        public function get body():IDataOutput
        {
            return _body;
        }
    }
}

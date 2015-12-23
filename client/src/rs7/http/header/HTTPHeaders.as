package rs7.http.header
{
    import mx.collections.ArrayCollection;
    
    public class HTTPHeaders extends ArrayCollection implements IHTTPHeaders
    {
        public function HTTPHeaders(source:Array = null)
        {
            super(source);
        }
        
        public function addHeader(header:IHTTPHeader):void
        {
            addItem(header);
        }
    }
}

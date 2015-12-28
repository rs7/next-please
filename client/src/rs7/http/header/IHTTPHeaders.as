package rs7.http.header
{
    public interface IHTTPHeaders
    {
        function get source():Array;
        
        function addHeader(header:IHTTPHeader):void;
    }
}

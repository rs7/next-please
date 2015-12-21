package rs7.http
{
    import rs7.http.header.IHTTPHeaders;
    
    public interface IHTTPMessage
    {
        function get headers():IHTTPHeaders;
    }
}

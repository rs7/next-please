package rs7.http.message
{
    import rs7.http.header.IHTTPHeaders;
    
    public interface IHTTPMessage
    {
        function get headers():IHTTPHeaders;
    }
}

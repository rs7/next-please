package rs7.http
{
    import rs7.http.header.HTTPHeaders;
    
    public interface IHTTPMessage
    {
        function get headers():HTTPHeaders;
    }
}

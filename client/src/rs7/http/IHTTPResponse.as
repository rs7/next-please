package rs7.http
{
    import rs7.http.status.HTTPStatus;
    
    public interface IHTTPResponse extends IHTTPInputMessage
    {
        function get status():HTTPStatus;
    }
}

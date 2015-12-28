package rs7.http.response
{
    import rs7.http.message.IHTTPInputMessage;
    import rs7.http.status.HTTPStatus;
    
    public interface IHTTPResponse extends IHTTPInputMessage
    {
        function get status():HTTPStatus;
    }
}

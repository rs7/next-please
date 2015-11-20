package rs7.http
{
    public interface IHTTPResponse extends IHTTPInputMessage
    {
        function get status():HTTPStatus;
    }
}

package rs7.http
{
    public interface IHTTPRequest extends IHTTPOutputMessage
    {
        function get method():HTTPMethod;
        function get uri():URI;
    }
}

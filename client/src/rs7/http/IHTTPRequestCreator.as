package rs7.http
{
    use namespace http_internal;
    
    public interface IHTTPRequestCreator
    {
        function create(method:HTTPMethod, uri:String):HTTPRequest;
    }
}

package rs7.http.request
{
    import rs7.http.message.IHTTPOutputMessage;
    import rs7.http.method.HTTPMethod;
    import rs7.http.uri.URI;
    
    public interface IHTTPRequest extends IHTTPOutputMessage
    {
        function get method():HTTPMethod;
        
        function set method(value:HTTPMethod):void;
        
        function get uri():URI;
        
        function set uri(value:URI):void;
    }
}

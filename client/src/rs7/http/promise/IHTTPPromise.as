package rs7.http.promise
{
    import org.osflash.signals.Promise;
    
    import rs7.http.response.IHTTPResponse;
    
    public interface IHTTPPromise
    {
        function get fail():Promise;
        
        function get response():IHTTPResponse;
        
        function get success():Promise;
    }
}

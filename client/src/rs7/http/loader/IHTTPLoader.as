package rs7.http.loader
{
    import rs7.http.IHTTPRequest;
    import rs7.http.promise.IHTTPPromise;
    
    public interface IHTTPLoader
    {
        function load(request:IHTTPRequest):IHTTPPromise;
    }
}

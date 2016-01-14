package rs7.http.loader
{
    import com.codecatalyst.promise.Promise;
    
    import rs7.http.request.IHTTPRequest;
    
    public interface IHTTPLoader
    {
        function load(request:IHTTPRequest):Promise;
    }
}

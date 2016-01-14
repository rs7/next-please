package rs7.util.async
{
    import com.codecatalyst.promise.Promise;
    
    public interface IAsyncResult
    {
        function get promise():Promise;
    }
}

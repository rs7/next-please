package rs7.http.message
{
    import flash.utils.IDataOutput;
    
    public interface IHTTPOutputMessage extends IHTTPMessage
    {
        function get body():IDataOutput;
    }
}

package rs7.http.message
{
    import flash.utils.IDataInput;
    
    public interface IHTTPInputMessage extends IHTTPMessage
    {
        function get body():IDataInput;
    }
}

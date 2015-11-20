package rs7.http
{
    import flash.utils.IDataInput;
    
    public interface IHTTPInputMessage extends IHTTPMessage
    {
        function get body():IDataInput;
    }
}

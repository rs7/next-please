package rs7.http
{
    import flash.utils.IDataOutput;
    
    public interface IHTTPOutputMessage extends IHTTPMessage
    {
        function get body():IDataOutput;
    }
}

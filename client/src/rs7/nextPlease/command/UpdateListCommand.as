package rs7.nextPlease.command
{
    import mx.collections.ArrayCollection;
    
    import rs7.http.method.HTTPMethod;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.response.IHTTPResponse;
    import rs7.http.uri.URI;
    import rs7.nextPlease.command.http.HTTPCommand;
    import rs7.nextPlease.model.Model;
    
    public class UpdateListCommand extends HTTPCommand
    {
        [Inject]
        public var model:Model;
        
        override protected function initRequest(request:IHTTPRequest):void
        {
            request.method = HTTPMethod.GET;
            request.uri = new URI("http://localhost:8090/record-book/1/records.amf");
        }
        
        override protected function onSuccess(response:IHTTPResponse):void
        {
            var records:ArrayCollection = ArrayCollection(response.body.readObject());
            model.records = records;
        }
    }
}

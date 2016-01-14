package rs7.nextPlease.command
{
    import mx.collections.ArrayCollection;
    import mx.utils.StringUtil;
    
    import rs7.http.method.HTTPMethod;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.response.IHTTPResponse;
    import rs7.http.uri.URI;
    import rs7.nextPlease.command.http.HTTPCommand;
    import rs7.nextPlease.entity.api.model.IUser;
    
    public class UpdateUserHistoryCommand extends HTTPCommand
    {
        [Inject]
        public var user:IUser;
    
        override public function execute():void
        {
            //super.execute();
        }
    
        override protected function initRequest(request:IHTTPRequest):void
        {
            request.method = HTTPMethod.GET;
            //request.uri = new URI(StringUtil.substitute("http://localhost:8090/user/{0}/changes.amf", user.id));
        }
        
        override protected function onSuccess(response:IHTTPResponse):void
        {
            var changes:ArrayCollection = ArrayCollection(response.body.readObject());
            //user.changes = changes;
        }
    }
}

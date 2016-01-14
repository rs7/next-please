package rs7.nextPlease.entity.command
{
    import rs7.http.header.IHTTPHeader;
    import rs7.http.method.HTTPMethod;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.response.IHTTPResponse;
    import rs7.http.uri.URI;
    import rs7.nextPlease.command.http.HTTPCommand;
    import rs7.nextPlease.entity.api.IRemoteEntity;
    
    public class GetRemoteEntityCommand extends HTTPCommand
    {
        [Inject(name="amfAcceptHeader")]
        public var acceptHeader:IHTTPHeader;
        
        [Inject]
        public var uri:URI;
        
        final override protected function initRequest(request:IHTTPRequest):void
        {
            request.method = HTTPMethod.GET;
            request.uri = uri;
            request.headers.addHeader(acceptHeader);
        }
        
        final override protected function onSuccess(response:IHTTPResponse):void
        {
            var responseObject:* = response.body.readObject();
            
            if (!responseObject is IRemoteEntity)
            {
                onFail(new Error("Wrong entity response"));
                return;
            }
            
            var entity:IRemoteEntity = IRemoteEntity(responseObject);
            
            resolve(entity);
        }
    }
}

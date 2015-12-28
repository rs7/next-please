package rs7.nextPlease.command
{
    import mx.utils.StringUtil;
    
    import rs7.http.method.HTTPMethod;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.response.IHTTPResponse;
    import rs7.http.uri.URI;
    import rs7.nextPlease.entity.Record;
    import rs7.nextPlease.model.Model;
    
    public class SetVKInfoUserCommand extends HTTPCommand
    {
        [Inject]
        public var model:Model;
        
        override protected function initRequest(request:IHTTPRequest):void
        {
            var userIDs:Array = [];
            for each(var record:Record in model.records)
            {
                userIDs.push(record.user.id);
            }
            
            request.method = HTTPMethod.GET;
            request.uri = new URI(
                StringUtil.substitute(
                    "http://api.vk.com/method/users.get.xml?user_ids={0}&fields=photo_100",
                    userIDs.join(",")
                )
            );
        }
        
        override protected function onSuccess(response:IHTTPResponse):void
        {
            var responseXML:XML = XML(response.body.readUTFBytes(response.body.bytesAvailable));
            
            for each(var record:Record in model.records)
            {
                var searchResult:XMLList = responseXML.user.(uid == record.user.id);
                
                if (searchResult.length() == 0)
                {
                    continue;
                }
                
                var userXML:XML = searchResult[0];
                record.user.name = StringUtil.substitute("{0} {1}", userXML.first_name, userXML.last_name);
                record.user.photoURL = userXML.photo_100;
            }
        }
    }
}

package rs7.nextPlease.entity.command
{
    import robotlegs.bender.extensions.commandCenter.api.CommandPayload;
    
    import rs7.http.uri.URI;
    import rs7.nextPlease.entity.EntityTypeMap;
    
    import rs7.nextPlease.entity.api.IEntityIdentifier;
    import rs7.robotlegs.bender.extensions.promiseCommand.api.IPromiseCommandMap;
    import rs7.robotlegs.bender.extensions.promiseCommand.impl.PromiseCommand;
    
    public class GetRemoteEntity2Command extends PromiseCommand
    {
        [Inject]
        public var map:EntityTypeMap;
        
        [Inject]
        public var identifier:IEntityIdentifier;
        
        [Inject]
        public var promiseCommandMap:IPromiseCommandMap;
        
        override public function execute():void
        {
            var uri:URI = map.getEntityType(identifier.type.name).getUriTemplate().createURI(identifier.id);
            
            promiseCommandMap
                .map(GetRemoteEntityCommand)
                .execute(new CommandPayload([uri],[URI]))
                .promise().then(resolve, reject);
        }
    }
}

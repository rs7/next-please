package rs7.nextPlease.config
{
    import robotlegs.bender.extensions.commandCenter.api.CommandPayload;
    import robotlegs.bender.extensions.contextView.ContextView;
    import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
    import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
    import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
    import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
    import robotlegs.bender.framework.api.IConfig;
    import robotlegs.bender.framework.api.IInjector;
    
    import rs7.http.header.HTTPHeader;
    import rs7.http.header.HTTPHeadersNames;
    import rs7.http.header.IHTTPHeader;
    import rs7.http.loader.HTTPLoader;
    import rs7.http.loader.HTTPLoaderCreator;
    import rs7.http.loader.IHTTPLoader;
    import rs7.http.loader.IHTTPLoaderCreator;
    import rs7.http.request.HTTPRequest;
    import rs7.http.request.HTTPRequestCreator;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.request.IHTTPRequestCreator;
    import rs7.http.uri.URI;
    import rs7.nextPlease.command.ShowMainCommand;
    import rs7.nextPlease.command.UpdateListCommand;
    import rs7.nextPlease.command.UpdateRecordBookCommand;
    import rs7.nextPlease.entity.command.UpdateEntityByRemoteEntityCommand;
    import rs7.nextPlease.entity.command.GetRemoteEntityCommand;
    import rs7.nextPlease.entity.EntityIdentifier;
    import rs7.nextPlease.entity.EntityType;
    import rs7.nextPlease.entity.api.model.IChange;
    import rs7.nextPlease.entity.api.model.IRecord;
    import rs7.nextPlease.entity.api.model.IRecordBook;
    import rs7.nextPlease.entity.api.model.IRelation;
    import rs7.nextPlease.entity.api.model.IUser;
    import rs7.nextPlease.entity.impl.model.Change;
    import rs7.nextPlease.entity.impl.model.Record;
    import rs7.nextPlease.entity.impl.model.RecordBook;
    import rs7.nextPlease.entity.impl.model.Relation;
    import rs7.nextPlease.entity.impl.model.User;
    import rs7.nextPlease.entity.manager.EntityManager;
    import rs7.nextPlease.entity.manager.IEntityManager;
    import rs7.nextPlease.entity.map.EntityMap;
    import rs7.nextPlease.entity.map.RemoteEntityMap;
    import rs7.nextPlease.model.Model;
    import rs7.nextPlease.signal.MainRecordBookUpdateSignal;
    import rs7.nextPlease.signal.RecordsUpdateSignal;
    import rs7.nextPlease.signal.entity.MarkEntityAsNeedToUpdateSignal;
    import rs7.nextPlease.signal.entity.RemoteEntityUpdatedSignal;
    import rs7.nextPlease.view.RecordBookMediator;
    import rs7.nextPlease.view.RecordBookView;
    
    public class Config implements IConfig
    {
        [Inject]
        public var commandMap:IEventCommandMap;
        
        [Inject]
        public var contextView:ContextView;
        
        [Inject]
        public var directCommandMap:IDirectCommandMap;
        
        [Inject]
        public var injector:IInjector;
        
        [Inject]
        public var mediatorMap:IMediatorMap;
        
        [Inject]
        public var signalCommandMap:ISignalCommandMap;
        
        public function configure():void
        {
            httpComponents();
            entityComponents();
            settings();
            signals();
            models();
            mediators();
            mapCommands();
            runCommands();
        }
        
        private function entityComponents():void
        {
            injector.map(EntityMap).asSingleton();
            injector.map(RemoteEntityMap).asSingleton();
            injector.map(EntityManager).asSingleton();
            injector.map(IEntityManager).toType(EntityManager);
            
            //todo: автоматизировать
            injector.map(IRecordBook).toType(RecordBook);
            injector.map(IRecord).toType(Record);
            injector.map(IChange).toType(Change);
            injector.map(IUser).toType(User);
            injector.map(IRelation).toType(Relation);
        }
        
        private function httpComponents():void
        {
            injector.map(IHTTPLoader).toType(HTTPLoader);
            injector.map(IHTTPRequest).toType(HTTPRequest);
            injector.map(IHTTPLoaderCreator).toSingleton(HTTPLoaderCreator);
            injector.map(IHTTPRequestCreator).toSingleton(HTTPRequestCreator);
        }
        
        private function mapCommands():void
        {
            signalCommandMap.map(MainRecordBookUpdateSignal).toCommand(UpdateListCommand);
            //signalCommandMap.map(RecordsUpdateSignal).toCommand(SetVKInfoUserCommand);
            //signalCommandMap.map(RecordsUpdateSignal).toCommand(SetHistoryCommand);
            injector.map(RecordsUpdateSignal).asSingleton();
            
            signalCommandMap.map(MarkEntityAsNeedToUpdateSignal).toCommand(GetRemoteEntityCommand);
            signalCommandMap.map(RemoteEntityUpdatedSignal).toCommand(UpdateEntityByRemoteEntityCommand);
        }
        
        private function mediators():void
        {
            mediatorMap.map(RecordBookView).toMediator(RecordBookMediator);
        }
        
        private function models():void
        {
            injector.map(Model).asSingleton();
        }
        
        private function runCommands():void
        {
            directCommandMap.map(ShowMainCommand).execute();
            
            var payload:CommandPayload = new CommandPayload();
            payload.addPayload(new EntityIdentifier(EntityType.RECORD_BOOK, 1), EntityIdentifier);
            directCommandMap.map(UpdateRecordBookCommand).execute(payload);
        }
        
        private function settings():void
        {
            injector.map(IHTTPHeader, "amfAcceptHeader").toValue(
                new HTTPHeader(HTTPHeadersNames.ACCEPT, "application/x-amf")
            );
            injector.map(URI, "remoteAddress").toValue(new URI("http://localhost:8090"));
        }
        
        private function signals():void
        {
            
        }
    }
}

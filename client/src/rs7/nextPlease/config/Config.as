package rs7.nextPlease.config
{
    import robotlegs.bender.extensions.contextView.ContextView;
    import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
    import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
    import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
    import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
    import robotlegs.bender.framework.api.IConfig;
    import robotlegs.bender.framework.api.IInjector;
    
    import rs7.http.loader.HTTPLoader;
    import rs7.http.loader.HTTPLoaderCreator;
    import rs7.http.loader.IHTTPLoader;
    import rs7.http.loader.IHTTPLoaderCreator;
    import rs7.http.request.HTTPRequest;
    import rs7.http.request.HTTPRequestCreator;
    import rs7.http.request.IHTTPRequest;
    import rs7.http.request.IHTTPRequestCreator;
    import rs7.nextPlease.command.SetHistoryCommand;
    import rs7.nextPlease.command.SetVKInfoUserCommand;
    import rs7.nextPlease.command.ShowMainCommand;
    import rs7.nextPlease.command.UpdateListCommand;
    import rs7.nextPlease.model.Model;
    import rs7.nextPlease.signal.RecordsUpdateSignal;
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
            models();
            mediators();
            mapCommands();
            runCommands();
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
            signalCommandMap.map(RecordsUpdateSignal).toCommand(SetVKInfoUserCommand);
            signalCommandMap.map(RecordsUpdateSignal).toCommand(SetHistoryCommand);
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
            directCommandMap.map(UpdateListCommand).execute();
        }
    }
}

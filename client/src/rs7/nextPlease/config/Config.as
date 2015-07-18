package rs7.nextPlease.config
{
    import robotlegs.bender.extensions.contextView.ContextView;
    import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
    import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
    import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
    import robotlegs.bender.framework.api.IConfig;
    import robotlegs.bender.framework.api.IInjector;
    
    import rs7.nextPlease.command.SetTestDataToListCommand;
    import rs7.nextPlease.command.ShowMainCommand;
    import rs7.nextPlease.model.ListModel;
    import rs7.nextPlease.view.ListMediator;
    import rs7.nextPlease.view.ListView;
    
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
        
        public function configure():void
        {
            models();
            mediators();
            runCommands();
        }
        
        private function mediators():void
        {
            mediatorMap.map(ListView).toMediator(ListMediator);
        }
        
        private function models():void
        {
            injector.map(ListModel).asSingleton();
        }
        
        private function runCommands():void
        {
            directCommandMap.map(ShowMainCommand).execute();
            directCommandMap.map(SetTestDataToListCommand).execute();
        }
    }
}

package rs7.nextPlease.config
{
    import robotlegs.bender.extensions.contextView.ContextView;
    import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
    import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
    import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
    import robotlegs.bender.framework.api.IConfig;
    import robotlegs.bender.framework.api.IInjector;
    
    import rs7.nextPlease.command.SetVKInfoUserCommand;
    import rs7.nextPlease.command.ShowMainCommand;
    import rs7.nextPlease.command.UpdateListCommand;
    import rs7.nextPlease.model.Model;
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
        
        public function configure():void
        {
            models();
            mediators();
            mapCommands();
            runCommands();
        }
        
        private function mapCommands():void
        {
            commandMap.map(Model.RECORDS_UPDATE_EVENT_TYPE).toCommand(SetVKInfoUserCommand);
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

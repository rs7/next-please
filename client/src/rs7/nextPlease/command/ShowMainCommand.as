package rs7.nextPlease.command
{
    import mx.core.IVisualElementContainer;
    
    import robotlegs.bender.bundles.mvcs.Command;
    import robotlegs.bender.extensions.contextView.ContextView;
    
    import rs7.nextPlease.view.MainView;
    
    public class ShowMainCommand extends Command
    {
        [Inject]
        public var contextView:ContextView;
        
        override public function execute():void
        {
            var mainView:MainView = new MainView();
            mainView.percentWidth = 100;
            mainView.percentHeight = 100;
            IVisualElementContainer(contextView.view).addElement(mainView);
        }
    }
}

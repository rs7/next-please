package rs7.nextPlease.view
{
    import mx.binding.utils.BindingUtils;
    
    import robotlegs.bender.bundles.mvcs.Mediator;
    
    import rs7.nextPlease.model.ListModel;
    
    public class ListMediator extends Mediator
    {
        [Inject]
        public var listModel:ListModel;
        
        [Inject]
        public var view:ListView;
        
        override public function initialize():void
        {
            BindingUtils.bindProperty(view, "dataProvider", listModel, "list");
        }
    }
}

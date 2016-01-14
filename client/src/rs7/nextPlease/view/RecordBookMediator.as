package rs7.nextPlease.view
{
    import mx.binding.utils.BindingUtils;
    
    import robotlegs.bender.bundles.mvcs.Mediator;
    
    import rs7.nextPlease.model.Model;
    
    public class RecordBookMediator extends Mediator
    {
        [Inject]
        public var model:Model;
        
        [Inject]
        public var view:RecordBookView;
        
        override public function initialize():void
        {
            BindingUtils.bindProperty(view, "recordBook", model, "mainRecordBook");
        }
    }
}

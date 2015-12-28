package rs7.robotlegs
{
    import robotlegs.bender.bundles.mvcs.Command;
    import robotlegs.bender.framework.api.IContext;
    
    public class AsyncCommand extends Command
    {
        [Inject]
        public var context:IContext;
        
        protected function detain():void
        {
            context.detain(this);
        }
        
        protected function release():void
        {
            context.release(this);
        }
    }
}

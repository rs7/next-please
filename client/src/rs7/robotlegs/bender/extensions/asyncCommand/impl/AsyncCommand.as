package rs7.robotlegs.bender.extensions.asyncCommand.impl
{
    import robotlegs.bender.bundles.mvcs.Command;
    import robotlegs.bender.framework.api.IContext;
    
    import rs7.robotlegs.bender.extensions.asyncCommand.api.IAsyncCommand;
    
    public class AsyncCommand extends Command implements IAsyncCommand
    {
        [Inject]
        public var context:IContext;
        
        final public function detain():void
        {
            context.detain(this);
        }
        
        final public function release():void
        {
            context.release(this);
        }
    }
}

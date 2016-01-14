package rs7.robotlegs.bender.extensions.promiseCommand.impl
{
    import com.codecatalyst.promise.Deferred;
    
    import rs7.robotlegs.bender.extensions.asyncCommand.impl.AsyncCommand;
    import rs7.robotlegs.bender.extensions.promiseCommand.api.IPromiseCommand;
    
    public class PromiseCommand extends AsyncCommand implements IPromiseCommand
    {
        [Inject]
        public var deferred:Deferred;
        
        public function reject(error:Error):void
        {
            deferred.reject(error);
            release();
        }
        
        public function resolve(result:*):void
        {
            deferred.resolve(result);
            release();
        }
    }
}

package rs7.robotlegs.bender.extensions.promiseCommand.api
{
    import rs7.robotlegs.bender.extensions.asyncCommand.api.IAsyncCommand;
    
    public interface IPromiseCommand extends IAsyncCommand
    {
        function reject(error:Error):void;
        
        function resolve(result:*):void;
    }
}

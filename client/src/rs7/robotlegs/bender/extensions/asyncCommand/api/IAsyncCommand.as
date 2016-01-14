package rs7.robotlegs.bender.extensions.asyncCommand.api
{
    import robotlegs.bender.extensions.commandCenter.api.ICommand;
    
    public interface IAsyncCommand extends ICommand
    {
        function detain():void;
        function release():void;
    }
}

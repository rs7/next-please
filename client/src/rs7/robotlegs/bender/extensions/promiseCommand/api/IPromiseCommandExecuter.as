package rs7.robotlegs.bender.extensions.promiseCommand.api
{
    import robotlegs.bender.extensions.commandCenter.api.CommandPayload;
    
    public interface IPromiseCommandExecuter
    {
        function execute(payload:CommandPayload = null):IPromiseCommandExecuteResult;
    }
}

package rs7.robotlegs.bender.extensions.promiseCommand.api
{
    public interface IPromiseCommandMapper
    {
        function map(commandClass:Class):IPromiseCommandExecuter;
    }
}

package rs7.robotlegs.bender.extensions.promiseCommand.impl
{
    import com.codecatalyst.promise.Deferred;
    import com.codecatalyst.promise.Promise;
    
    import robotlegs.bender.extensions.commandCenter.api.CommandPayload;
    import robotlegs.bender.extensions.commandCenter.api.ICommandExecutor;
    import robotlegs.bender.extensions.commandCenter.api.ICommandMapping;
    import robotlegs.bender.extensions.commandCenter.api.ICommandMappingList;
    import robotlegs.bender.extensions.commandCenter.impl.CommandExecutor;
    import robotlegs.bender.extensions.commandCenter.impl.CommandMapping;
    import robotlegs.bender.extensions.commandCenter.impl.CommandMappingList;
    import robotlegs.bender.extensions.commandCenter.impl.NullCommandTrigger;
    import robotlegs.bender.framework.api.IContext;
    import robotlegs.bender.framework.api.IInjector;
    
    import rs7.robotlegs.bender.extensions.promiseCommand.api.IPromiseCommandExecuteResult;
    import rs7.robotlegs.bender.extensions.promiseCommand.api.IPromiseCommandExecuter;
    import rs7.robotlegs.bender.extensions.promiseCommand.api.IPromiseCommandMap;
    import rs7.robotlegs.bender.extensions.promiseCommand.api.IPromiseCommandMapper;
    
    public class PromiseCommandMap implements IPromiseCommandMap, IPromiseCommandMapper, IPromiseCommandExecuter, IPromiseCommandExecuteResult
    {
        private static const EMPTY_MAPPING_PROCESSORS:Array = [];
        
        public function PromiseCommandMap(context:IContext)
        {
            _deferred = new Deferred();
            
            var _injector:IInjector = context.injector.createChild();
            _injector.map(Deferred).toValue(_deferred);
            
            _mappings = new CommandMappingList(new NullCommandTrigger(), EMPTY_MAPPING_PROCESSORS, context.getLogger(this));
            
            _executor = new CommandExecutor(_injector, _mappings.removeMapping);
        }
        
        private var _deferred:Deferred;
        private var _executor:ICommandExecutor;
        private var _mappings:ICommandMappingList;
        
        public function execute(payload:CommandPayload = null):IPromiseCommandExecuteResult
        {
            _executor.executeCommands(_mappings.getList(), payload);
            return this;
        }
        
        public function map(commandClass:Class):IPromiseCommandExecuter
        {
            var mapping:ICommandMapping = new CommandMapping(commandClass);
            mapping.setFireOnce(true);
            _mappings.addMapping(mapping);
            return this;
        }
        
        public function promise():Promise
        {
            return _deferred.promise;
        }
    }
}

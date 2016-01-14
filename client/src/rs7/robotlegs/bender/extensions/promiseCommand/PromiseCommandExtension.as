package rs7.robotlegs.bender.extensions.promiseCommand
{
    import robotlegs.bender.framework.api.IContext;
    import robotlegs.bender.framework.api.IExtension;
    
    import rs7.robotlegs.bender.extensions.promiseCommand.api.IPromiseCommandMap;
    import rs7.robotlegs.bender.extensions.promiseCommand.impl.PromiseCommandMap;
    
    public class PromiseCommandExtension implements IExtension
    {
        public function extend(context:IContext):void
        {
            context.injector.map(IPromiseCommandMap).toType(PromiseCommandMap);
        }
    }
}

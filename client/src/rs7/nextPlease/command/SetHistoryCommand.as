package rs7.nextPlease.command
{
    import robotlegs.bender.bundles.mvcs.Command;
    import robotlegs.bender.extensions.commandCenter.api.CommandPayload;
    import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
    import robotlegs.bender.framework.api.IContext;
    
    import rs7.nextPlease.entity.Record;
    import rs7.nextPlease.entity.User;
    import rs7.nextPlease.model.Model;
    
    public class SetHistoryCommand extends Command
    {
        [Inject]
        public var context:IContext;
        
        [Inject]
        public var directCommandMap:IDirectCommandMap;
        
        [Inject]
        public var model:Model;
        
        override public function execute():void
        {
            for each(var record:Record in model.records)
            {
                var payload:CommandPayload = new CommandPayload();
                payload.addPayload(record.user, User);
                
                directCommandMap.map(UpdateUserHistory).execute(payload);
            }
        }
    }
}

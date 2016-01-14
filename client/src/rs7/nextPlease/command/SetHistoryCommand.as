package rs7.nextPlease.command
{
    import robotlegs.bender.bundles.mvcs.Command;
    import robotlegs.bender.extensions.commandCenter.api.CommandPayload;
    import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
    
    import rs7.nextPlease.entity.impl.model.Record;
    import rs7.nextPlease.entity.impl.model.User;
    import rs7.nextPlease.model.Model;
    
    public class SetHistoryCommand extends Command
    {
        [Inject]
        public var directCommandMap:IDirectCommandMap;
        
        [Inject]
        public var model:Model;
        
        override public function execute():void
        {
            for each(var record:Record in model.mainRecordBook.records)
            {
                var payload:CommandPayload = new CommandPayload();
                payload.addPayload(record.user, User);
                
                directCommandMap.map(UpdateUserHistoryCommand).execute(payload);
            }
        }
    }
}

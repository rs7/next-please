package rs7.nextPlease.command
{
    import robotlegs.bender.bundles.mvcs.Command;
    
    import rs7.nextPlease.entity.EntityIdentifier;
    import rs7.nextPlease.entity.EntityType;
    import rs7.nextPlease.entity.api.model.IRecordBook;
    import rs7.nextPlease.entity.manager.IEntityManager;
    import rs7.nextPlease.model.Model;
    import rs7.nextPlease.signal.MainRecordBookUpdateSignal;
    
    public class UpdateRecordBookCommand extends Command
    {
        [Inject]
        public var entityManager:IEntityManager;
        
        [Inject]
        public var mainRecordBookUpdateSignal:MainRecordBookUpdateSignal;
        
        [Inject]
        public var model:Model;
        
        override public function execute():void
        {
            model.mainRecordBook = IRecordBook(
                entityManager.getEntity(new EntityIdentifier(EntityType.RECORD_BOOK, 1))
            );
            mainRecordBookUpdateSignal.dispatch();
        }
    }
}

package rs7.nextPlease.entity.impl.model
{
    import rs7.nextPlease.entity.api.model.IRecord;
    import rs7.nextPlease.entity.api.model.IRecordBook;
    import rs7.nextPlease.entity.api.model.IUser;
    
    [Bindable]
    public class Record implements IRecord
    {
        public var date:Date;
        
        public var recordBook:IRecordBook;
        
        public var user:IUser;
    }
}

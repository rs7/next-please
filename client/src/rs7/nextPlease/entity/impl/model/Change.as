package rs7.nextPlease.entity.impl.model
{
    import rs7.nextPlease.entity.api.model.IChange;
    import rs7.nextPlease.entity.api.model.IRelation;
    import rs7.nextPlease.entity.api.model.IUser;
    
    [Bindable]
    public class Change implements IChange
    {
        public var date:Date;
        
        public var relation:IRelation;
        
        public var user:IUser;
    }
}

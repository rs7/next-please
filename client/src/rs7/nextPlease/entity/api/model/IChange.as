package rs7.nextPlease.entity.api.model
{
    public interface IChange
    {
        function get date():Date;
        
        function get relation():IRelation;
        
        function get user():IUser;
    }
}

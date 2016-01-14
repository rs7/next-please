package rs7.nextPlease.entity.api.model
{
    public interface IRecord
    {
        function get date():Date;
        
        function get recordBook():IRecordBook;
        
        function get user():IUser;
    }
}

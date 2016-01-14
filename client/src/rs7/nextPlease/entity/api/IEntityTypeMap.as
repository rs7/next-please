package rs7.nextPlease.entity.api
{
    public interface IEntityTypeMap
    {
        function getType(name:String):IEntityType;
        
        function setType(name:String, type:IEntityType):void;
    }
}

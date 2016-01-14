package rs7.util.enum
{
    public interface IEnumHelper
    {
        function initializeClass(clazz:Class):void;
        
        function valueOf(clazz:Class, key:String):IEnum;
        
        function values(clazz:Class):Array;
    }
}

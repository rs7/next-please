package rs7.util.map
{
    public interface IMap
    {
        function getValue(key:String):*;
        
        function setValue(key:String, value:*):void;
        
        function values():Array;
    }
}

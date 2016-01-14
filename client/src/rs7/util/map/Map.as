package rs7.util.map
{
    import flash.utils.Dictionary;
    
    public class Map implements IMap
    {
        private var dictionary:Dictionary = new Dictionary();
        
        public function getValue(key:String):*
        {
            return dictionary[key];
        }
        
        public function setValue(key:String, value:*):void
        {
            dictionary[key] = value;
        }
        
        public function values():Array
        {
            var values:Array = [];
            
            for each(var value:* in dictionary)
            {
                values.push(value);
            }
            
            return values;
        }
    }
}

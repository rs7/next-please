package rs7.io
{
    import rs7.lang.enum.Enum;
    
    public class Charset extends Enum
    {
        public static const UTF_8:Charset = new Charset("utf8");
        
        public function Charset(name:String, aliases:Array = null)
        {
            super(name);
            _name = name;
            _aliases = aliases;
        }
        
        private var _aliases:Array;
        private var _name:String;
        
        public function get aliases():Array
        {
            return _aliases;
        }
        
        public function get name():String
        {
            return _name;
        }
    }
}

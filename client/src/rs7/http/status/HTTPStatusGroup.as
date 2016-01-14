package rs7.http.status
{
    import rs7.util.enum.Enum;
    
    internal class HTTPStatusGroup extends Enum
    {
        public static const INFORMATIONAL:HTTPStatusGroup = new HTTPStatusGroup(1);
        public static const SUCCESSFUL:HTTPStatusGroup = new HTTPStatusGroup(2);
        public static const REDIRECTION:HTTPStatusGroup = new HTTPStatusGroup(3);
        public static const CLIENT_ERROR:HTTPStatusGroup = new HTTPStatusGroup(4);
        public static const SERVER_ERROR:HTTPStatusGroup = new HTTPStatusGroup(5);
        
        public function HTTPStatusGroup(code:int)
        {
            super(code);
            _code = code;
        }
        
        private var _code:int;
        
        public function get code():int
        {
            return _code;
        }
    }
}

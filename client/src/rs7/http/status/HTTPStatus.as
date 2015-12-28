package rs7.http.status
{
    import rs7.lang.enum.Enum;
    
    public class HTTPStatus extends Enum
    {
        //--------------------------------
        // 1xx Informational
        //--------------------------------
        
        public static const CONTINUE:HTTPStatus = new HTTPStatus(100, "Continue");
        
        public static const SWITCHING_PROTOCOLS:HTTPStatus = new HTTPStatus(101, "Switching Protocols");
        
        public static const PROCESSING:HTTPStatus = new HTTPStatus(102, "Processing");
        
        public static const CHECKPOINT:HTTPStatus = new HTTPStatus(103, "Checkpoint");
        
        //--------------------------------
        // 2xx Success
        //--------------------------------
        
        public static const OK:HTTPStatus = new HTTPStatus(200, "OK");
        
        public static const CREATED:HTTPStatus = new HTTPStatus(201, "Created");
        
        public static const ACCEPTED:HTTPStatus = new HTTPStatus(202, "Accepted");
        
        public static const NON_AUTHORITATIVE_INFORMATION:HTTPStatus = new HTTPStatus(203, "Non-Authoritative Information");
        
        public static const NO_CONTENT:HTTPStatus = new HTTPStatus(204, "No Content");
        
        public static const RESET_CONTENT:HTTPStatus = new HTTPStatus(205, "Reset Content");
        
        public static const PARTIAL_CONTENT:HTTPStatus = new HTTPStatus(206, "Partial Content");
        
        public static const MULTI_STATUS:HTTPStatus = new HTTPStatus(207, "Multi-Status");
        
        public static const ALREADY_REPORTED:HTTPStatus = new HTTPStatus(208, "Already Reported");
        
        public static const IM_USED:HTTPStatus = new HTTPStatus(226, "IM Used");
        
        //--------------------------------
        // 3xx Redirection
        //--------------------------------
        
        public static const MULTIPLE_CHOICES:HTTPStatus = new HTTPStatus(300, "Multiple Choices");
        
        public static const MOVED_PERMANENTLY:HTTPStatus = new HTTPStatus(301, "Moved Permanently");
        
        public static const FOUND:HTTPStatus = new HTTPStatus(302, "Found");
        
        public static const SEE_OTHER:HTTPStatus = new HTTPStatus(303, "See Other");
        
        public static const NOT_MODIFIED:HTTPStatus = new HTTPStatus(304, "Not Modified");
        
        public static const SWITCH_PROXY:HTTPStatus = new HTTPStatus(306, "Switch Proxy");
        
        public static const TEMPORARY_REDIRECT:HTTPStatus = new HTTPStatus(307, "Temporary Redirect");
        
        public static const PERMANENT_REDIRECT:HTTPStatus = new HTTPStatus(308, "Permanent Redirect");
        
        //--------------------------------
        // 4xx Client Error
        //--------------------------------
        
        public static const BAD_REQUEST:HTTPStatus = new HTTPStatus(400, "Bad Request");
        
        public static const UNAUTHORIZED:HTTPStatus = new HTTPStatus(401, "Unauthorized");
        
        public static const PAYMENT_REQUIRED:HTTPStatus = new HTTPStatus(402, "Payment Required");
        
        public static const FORBIDDEN:HTTPStatus = new HTTPStatus(403, "Forbidden");
        
        public static const NOT_FOUND:HTTPStatus = new HTTPStatus(404, "Not Found");
        
        public static const METHOD_NOT_ALLOWED:HTTPStatus = new HTTPStatus(405, "Method Not Allowed");
        
        public static const NOT_ACCEPTABLE:HTTPStatus = new HTTPStatus(406, "Not Acceptable");
        
        public static const PROXY_AUTHENTICATION_REQUIRED:HTTPStatus = new HTTPStatus(407, "Proxy Authentication Required");
        
        public static const REQUEST_TIMEOUT:HTTPStatus = new HTTPStatus(408, "Request Timeout");
        
        public static const CONFLICT:HTTPStatus = new HTTPStatus(409, "Conflict");
        
        public static const GONE:HTTPStatus = new HTTPStatus(410, "Gone");
        
        public static const LENGTH_REQUIRED:HTTPStatus = new HTTPStatus(411, "Length Required");
        
        public static const PRECONDITION_FAILED:HTTPStatus = new HTTPStatus(412, "Precondition Failed");
        
        public static const PAYLOAD_TOO_LARGE:HTTPStatus = new HTTPStatus(413, "Payload Too Large");
        
        public static const URI_TOO_LONG:HTTPStatus = new HTTPStatus(414, "URI Too Long");
        
        public static const UNSUPPORTED_MEDIA_TYPE:HTTPStatus = new HTTPStatus(415, "Unsupported Media Type");
        
        public static const RANGE_NOT_SATISFIABLE:HTTPStatus = new HTTPStatus(416, "Range Not Satisfiable");
        
        public static const EXPECTATION_FAILED:HTTPStatus = new HTTPStatus(417, "Expectation Failed");
        
        public static const I_AM_A_TEAPOT:HTTPStatus = new HTTPStatus(418, "I'm a teapot");
        
        public static const DESTINATION_LOCKED:HTTPStatus = new HTTPStatus(421, "Destination Locked");
        
        public static const UNPROCESSABLE_ENTITY:HTTPStatus = new HTTPStatus(422, "Unprocessable Entity");
        
        public static const LOCKED:HTTPStatus = new HTTPStatus(423, "Locked");
        
        public static const FAILED_DEPENDENCY:HTTPStatus = new HTTPStatus(424, "Failed Dependency");
        
        public static const UPGRADE_REQUIRED:HTTPStatus = new HTTPStatus(426, "Upgrade Required");
        
        public static const PRECONDITION_REQUIRED:HTTPStatus = new HTTPStatus(428, "Precondition Required");
        
        public static const TOO_MANY_REQUESTS:HTTPStatus = new HTTPStatus(429, "Too Many Requests");
        
        public static const REQUEST_HEADER_FIELDS_TOO_LARGE:HTTPStatus = new HTTPStatus(431, "Request Header Fields Too Large");
        
        //--------------------------------
        // 5xx Server Error
        //--------------------------------
        
        public static const INTERNAL_SERVER_ERROR:HTTPStatus = new HTTPStatus(500, "Internal Server Error");
        
        public static const NOT_IMPLEMENTED:HTTPStatus = new HTTPStatus(501, "Not Implemented");
        
        public static const BAD_GATEWAY:HTTPStatus = new HTTPStatus(502, "Bad Gateway");
        
        public static const SERVICE_UNAVAILABLE:HTTPStatus = new HTTPStatus(503, "Service Unavailable");
        
        public static const GATEWAY_TIMEOUT:HTTPStatus = new HTTPStatus(504, "Gateway Timeout");
        
        public static const HTTP_VERSION_NOT_SUPPORTED:HTTPStatus = new HTTPStatus(505, "HTTP Version not supported");
        
        public static const VARIANT_ALSO_NEGOTIATES:HTTPStatus = new HTTPStatus(506, "Variant Also Negotiates");
        
        public static const INSUFFICIENT_STORAGE:HTTPStatus = new HTTPStatus(507, "Insufficient Storage");
        
        public static const LOOP_DETECTED:HTTPStatus = new HTTPStatus(508, "Loop Detected");
        
        public static const BANDWIDTH_LIMIT_EXCEEDED:HTTPStatus = new HTTPStatus(509, "Bandwidth Limit Exceeded");
        
        public static const NOT_EXTENDED:HTTPStatus = new HTTPStatus(510, "Not Extended");
        
        public static const NETWORK_AUTHENTICATION_REQUIRED:HTTPStatus = new HTTPStatus(511, "Network Authentication Required");
        
        //--------------------------------
        
        public function HTTPStatus(code:int, reasonPhrase:String)
        {
            super(code);
            _code = code;
            _reasonPhrase = reasonPhrase;
        }
        
        private var _code:int;
        private var _reasonPhrase:String;
        
        public function get code():int
        {
            return _code;
        }
        
        public function get reasonPhrase():String
        {
            return _reasonPhrase;
        }
    }
}
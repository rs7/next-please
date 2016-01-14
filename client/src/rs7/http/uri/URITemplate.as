package rs7.http.uri
{
    import mx.utils.StringUtil;
    
    public class URITemplate
    {
        public function URITemplate(template:String)
        {
            _template = template;
        }
        
        private var _template:String;
        
        public function get template():String
        {
            return _template;
        }
        
        public function createURI(...params):URI
        {
            return new URI(StringUtil.substitute.apply(null, [template].concat(params)));
        }
    }
}

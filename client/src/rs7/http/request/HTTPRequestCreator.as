package rs7.http.request
{
    import robotlegs.bender.framework.api.IInjector;
    
    public class HTTPRequestCreator implements IHTTPRequestCreator
    {
        [Inject]
        public var injector:IInjector;
        
        public function create():IHTTPRequest
        {
            return injector.getInstance(IHTTPRequest);
        }
    }
}

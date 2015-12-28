package rs7.http.loader
{
    import robotlegs.bender.framework.api.IInjector;
    
    public class HTTPLoaderCreator implements IHTTPLoaderCreator
    {
        [Inject]
        public var injector:IInjector;
        
        public function create():IHTTPLoader
        {
            return injector.getInstance(IHTTPLoader);
        }
    }
}

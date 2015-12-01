package rs7.http.status
{
    import rs7.lang.enum.EnumMapper;
    
    public class HTTPStatusHelper
    {
        public static function getHTTPStatusGroup(httpStatus:HTTPStatus):HTTPStatusGroup
        {
            var groupCode:int = int(httpStatus.code / 100);
            return HTTPStatusGroup(EnumMapper.instance.getEnum(HTTPStatusGroup, groupCode));
        }
    }
}

package rs7.http.status
{
    import rs7.util.enum.EnumHelper;
    
    public class HTTPStatusHelper
    {
        public static function getHTTPStatusGroup(httpStatus:HTTPStatus):HTTPStatusGroup
        {
            var groupCode:int = int(httpStatus.code / 100);
            return HTTPStatusGroup(EnumHelper.instance.getEnum(HTTPStatusGroup, groupCode));
        }
    }
}

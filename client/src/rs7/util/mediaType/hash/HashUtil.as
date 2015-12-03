package rs7.util.mediaType.hash
{
    import com.hurlant.crypto.hash.MD5;
    import com.hurlant.util.Base64;
    
    import flash.utils.ByteArray;
    
    public class HashUtil
    {
        public static function md5(object:*):String
        {
            var dataByteArray:ByteArray = new ByteArray();
            dataByteArray.writeObject(object);
            return Base64.encodeByteArray(new MD5().hash(dataByteArray));
        }
    }
}

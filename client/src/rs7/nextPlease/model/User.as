package rs7.nextPlease.model
{
    [Bindable]
    public class User
    {
        public static function create(name:String, photoURL:String):User
        {
            var user:User = new User();
            user.name = name;
            user.photoURL = photoURL;
            return user;
        }
        
        public var name:String;
        public var photoURL:String;
    }
}

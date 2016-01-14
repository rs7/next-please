package rs7.nextPlease.entity
{
    import rs7.http.uri.URITemplate;
    import rs7.nextPlease.entity.api.IEntityType;
    import rs7.nextPlease.entity.api.IRemoteEntityType;
    import rs7.nextPlease.entity.impl.model.Change;
    import rs7.nextPlease.entity.impl.model.Record;
    import rs7.nextPlease.entity.impl.model.RecordBook;
    import rs7.nextPlease.entity.impl.model.Relation;
    import rs7.nextPlease.entity.impl.model.User;
    import rs7.util.enum.IEnum;
    
    public class EntityType implements IEntityType, IRemoteEntityType, IEnum
    {
        public static const CHANGE:EntityType = new EntityType(
            "change",
            Change,
            "change/{0}"
        );
        
        public static const RECORD:EntityType = new EntityType(
            "record",
            Record,
            "record/{0}"
        );
        
        public static const RECORD_BOOK:EntityType = new EntityType(
            "recordBook",
            RecordBook,
            "record-book/{0}"
        );
        
        public static const RELATION:EntityType = new EntityType(
            "relation",
            Relation,
            "relation/{0}"
        );
        
        public static const USER:EntityType = new EntityType(
            "user",
            User,
            "user/{0}"
        );
        
        public function EntityType(name:String, clazz:Class, uriTemplate:String)
        {
            _name = name;
            _uriTemplate = uriTemplate;
        }
        
        private var _clazz:Class;
        private var _name:String;
        private var _uriTemplate:String;
        
        public function get clazz():Class
        {
            return _clazz;
        }
        
        public function get key():String
        {
            return _name;
        }
        
        public function get name():String
        {
            return _name;
        }
        
        public function getUriTemplate():URITemplate
        {
            return new URITemplate(_uriTemplate);
        }
    }
}

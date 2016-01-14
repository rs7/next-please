package rs7.nextPlease.entity.command
{
    import mx.utils.StringUtil;
    
    import org.spicefactory.lib.reflect.ClassInfo;
    import org.spicefactory.lib.reflect.Property;
    
    import robotlegs.bender.bundles.mvcs.Command;
    
    import rs7.util.enum.IEnumHelper;
    import rs7.nextPlease.entity.EntityIdentifier;
    import rs7.nextPlease.entity.EntityType;
    import rs7.nextPlease.entity.impl.Entity;
    import rs7.nextPlease.entity.manager.EntityManager;
    import rs7.nextPlease.entity.map.EntityMap;
    import rs7.nextPlease.entity.map.RemoteEntityMap;
    import rs7.nextPlease.entity.api.IRemoteEntity;
    
    public class UpdateEntityByRemoteEntityCommand extends Command
    {
        private static const ID_PROPERTY_NAME:String = "id";
        private static const ENTITY_PROPERTY_NAME_TEMPLATE_GROUP_NAME:String = "name";
        private static const ENTITY_PROPERTY_NAME_TEMPLATE:RegExp = new RegExp(
            StringUtil.substitute(
                "(?P<{0}>\\w+)Id", ENTITY_PROPERTY_NAME_TEMPLATE_GROUP_NAME
            )
        );
        
        private static function entityPropertyName(entityPropertyWithIdName:String):String
        {
            return ENTITY_PROPERTY_NAME_TEMPLATE.exec(
                entityPropertyWithIdName
            )[ENTITY_PROPERTY_NAME_TEMPLATE_GROUP_NAME];
        }
        
        [Inject]
        public var entityManager:EntityManager;
        
        [Inject]
        public var entityMap:EntityMap;
        
        [Inject]
        public var enumHelper:IEnumHelper;
        
        [Inject]
        public var identifier:EntityIdentifier;
        
        [Inject]
        public var remoteEntityMap:RemoteEntityMap;
        
        override public function execute():void
        {
            var remoteEntity:IRemoteEntity = remoteEntityMap.getEntity(identifier);
            var entity:Entity = entityMap.getEntity(identifier);
            
            var remoteEntityCI:ClassInfo = ClassInfo.forInstance(remoteEntity);
            var entityCI:ClassInfo = ClassInfo.forInstance(entity);
            
            for each(var property:Property in remoteEntityCI.getProperties())
            {
                if (property.name == ID_PROPERTY_NAME)
                {
                    continue;
                }
                
                if (ENTITY_PROPERTY_NAME_TEMPLATE.test(property.name))
                {
                    var targetPropertyName:String = entityPropertyName(property.name);
                    
                    var targetClass:Class = entityCI.getProperty(targetPropertyName).type.getClass();
                    
                    var relationEntity:Entity = entityManager.getEntity(
                        new EntityIdentifier(
                            EntityType(
                                enumHelper.valueOf(EntityType, targetClass)
                            ), remoteEntity[property.name]
                        )
                    );
                    
                    entity[targetPropertyName] = relationEntity;
                    
                    continue;
                }
                
                entity[property.name] = remoteEntity[property.name];
            }
        }
    }
}

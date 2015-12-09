package rs7.entity
{
    public class Entity
    {
        public function Entity()
        {
            identifier = EntityIdentifier.createForNewInstance(this);
        }
        
        public var identifier:EntityIdentifier;
        
        public function set id(value:*):void
        {
            identifier.id = value;
        }
    }
}

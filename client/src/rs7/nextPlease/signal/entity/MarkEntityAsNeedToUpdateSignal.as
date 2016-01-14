package rs7.nextPlease.signal.entity
{
    import org.osflash.signals.Signal;
    
    import rs7.nextPlease.entity.api.IEntityIdentifier;
    
    public class MarkEntityAsNeedToUpdateSignal extends Signal
    {
        public function MarkEntityAsNeedToUpdateSignal()
        {
            super(IEntityIdentifier);
        }
    }
}

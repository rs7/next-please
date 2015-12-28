package rs7.util.error
{
    import flash.events.ErrorEvent;
    
    public function errorEventToError(event:ErrorEvent):Error
    {
        return new Error(event.text, event.errorID);
    }
}

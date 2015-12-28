package rs7.lang.abstract
{
    public class AbstractMethodError extends Error
    {
        public function AbstractMethodError()
        {
            super("This method must override in subclass");
        }
    }
}

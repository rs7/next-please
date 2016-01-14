package rs7.util.abstract
{
    public class AbstractMethodError extends Error
    {
        public function AbstractMethodError()
        {
            super("This method must override in subclass");
        }
    }
}

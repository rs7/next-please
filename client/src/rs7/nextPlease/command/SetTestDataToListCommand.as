package rs7.nextPlease.command
{
    import org.apache.flex.collections.VectorCollection;
    
    import robotlegs.bender.bundles.mvcs.Command;
    
    import rs7.nextPlease.model.ListModel;
    import rs7.nextPlease.model.User;
    
    public class SetTestDataToListCommand extends Command
    {
        [Inject]
        public var listModel:ListModel;
        
        override public function execute():void
        {
            var data:Vector.<User> = new <User>[
                User.create("Роман Суслин", "https://pp.vk.me/c622524/v622524662/3f977/X9TJ6nMzzTo.jpg"),
                User.create("Руслан Солкан", "https://pp.vk.me/c628617/v628617367/5200/7avTSWFeKx4.jpg")
            ];
            
            listModel.list = new VectorCollection(data);
            
            listModel.list.getItemAt(0).name = "Ромашка Суслин";
        }
    }
}

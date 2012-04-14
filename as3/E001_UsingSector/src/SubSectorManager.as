package
{
	import com.plter.lib.as3.sector.Manager;
	import com.plter.lib.as3.sector.protocols.ICommand;
	import com.plter.lib.as3.sector.protocols.IEvent;
	
	public class SubSectorManager extends Manager
	{
		
		public static const NAME:String="SubSectorManager";
		
		public function SubSectorManager()
		{
			super(null, NAME);
		}
		
		
		override public function handleCommand(command:ICommand):Boolean{
			trace("Sub Sector Manager handleCommand:name="+command.getName());
			return true;
		}
		
		
		override public function handleEvent(event:IEvent):Boolean{
			trace("Sub Sector Manager handleEvent:name="+event.getName());
			return true;
		}
	}
}
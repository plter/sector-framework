package
{
	import com.plter.lib.as3.sector.Func;
	import com.plter.lib.as3.sector.protocols.ICommand;
	
	public class StartupFunc extends Func
	{
		public function StartupFunc()
		{
			super(Commands.START_UP);
		}
		
		override public function execute(command:ICommand):Boolean{
			trace("Startup");
			
			getSector().dispatchEvent1(Events.ON_START_UP);
			return true;
		}
	}
}
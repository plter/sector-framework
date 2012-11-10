package
{
	import com.plter.lib.as3.sector.Sector;
	
	public class SubSector extends Sector
	{
		
		public static const NAME:String="SubSector";
		
		public function SubSector()
		{
			super(NAME);
			
			addFunction(new StartupFunc);
			
			setManager(new SubSectorManager);
		}
	}
}
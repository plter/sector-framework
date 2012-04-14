package
{
	import com.plter.lib.as3.sector.Sector;
	
	public class MainSector extends Sector
	{
		
		public static const NAME:String="MainSector";
		
		public function MainSector()
		{
			super(NAME);
			
			addSector(new SubSector);
		}
		
		
		private static var __instance:MainSector=null;
		
		public static function getInstance():MainSector{
			if (__instance==null) 
			{
				__instance=new MainSector;
			}
			return __instance;
		}
	}
}
package
{
	import flash.display.Sprite;
	
	public class E001_UsingSector extends Sprite
	{
		public function E001_UsingSector()
		{
			MainSector.getInstance().sendCommand1(Commands.START_UP);
		}
	}
}
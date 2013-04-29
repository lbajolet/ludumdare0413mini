package domi
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	
	[SWF(width = "640", height = "480", backgroundColor = "#aaaaaa")]
	public class MainApp extends FlxGame
	{
		
		public function MainApp()
		{
			super(640,480,MenuState,1);
			FlxG.mouse.show();
			//super(640,480,PlayState,1);
		}
	}
}
package domi
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	
	[SWF(width = "640", height = "480", backgroundColor = "#FFFFFF")]
	public class MainApp extends FlxGame
	{
		public function MainApp()
		{
			//super(640,480,MenuState,1);
			super(640,480,PlayState,1);
		}
	}
}
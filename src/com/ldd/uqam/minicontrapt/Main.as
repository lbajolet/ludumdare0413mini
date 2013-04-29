package com.ldd.uqam.minicontrapt
{
	import org.flixel.*; 
	[SWF(width = "640", height = "480", backgroundColor = "#ffffff")]
 
	public class Main extends FlxGame
	{
		[Embed ("../../../../../Assets/Sounds/Goto80_and_the_Uwe_Schenk_Band_-_01_-_Ponky_Fonky_Ferret.mp3")] public static var bgm:Class;
		
		public function Main()
		{
			super(640, 480, MenuState, 1);
		}
	}
}
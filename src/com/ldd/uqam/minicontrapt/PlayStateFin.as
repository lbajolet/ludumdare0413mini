package com.ldd.uqam.minicontrapt
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import mx.core.FlexSprite;
	import org.flixel.*;
 
	public class PlayStateFin extends FlxState
	{
		[Embed(source="../../../../../Assets/congrats.png")] public static var LevelSprite:Class;
		override public function create():void
		{	
			var bg:FlxSprite = new FlxSprite(16, 16, LevelSprite);
            add(bg);
		}
		
		
		override public function update():void
		{
			super.update();
		}
	}
}

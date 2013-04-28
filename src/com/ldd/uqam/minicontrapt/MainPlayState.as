package com.ldd.uqam.minicontrapt
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author R4PaSs
	 */
	public class MainPlayState extends FlxState
	{
		public var level:FlxTilemap;
		public var player:FlxSprite;
		
		override public function create():void {
			FlxG.bgColor = 0xffffffff;
			
			var data:Array = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
			level = new FlxTilemap();
			level.loadMap(FlxTilemap.arrayToCSV(data,15), FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
			add(level);
			add(new TrianglePlayer(0, 0));
		}
		
	}

}

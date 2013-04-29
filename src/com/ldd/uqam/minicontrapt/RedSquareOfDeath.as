package com.ldd.uqam.minicontrapt 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author R4PaSs
	 */
	public class RedSquareOfDeath extends FlxSprite
	{
		
		public function RedSquareOfDeath(x: int, y: int)
		{
			super(x, y);
			makeGraphic(16, 16, 0xffff0000);
		}

		public static function create_death_line(line_length: int, line_height: int ):FlxGroup {
			var rsodGroup:FlxGroup = new FlxGroup();
			var total = line_length / 16;
			for (var i:int = 0; i < total; i++ ) {
				var rsod:RedSquareOfDeath = new RedSquareOfDeath(i * 16, line_height);
				rsod.immovable = true;
				rsodGroup.add();
			}
			return rsodGroup;
		}
	}

}
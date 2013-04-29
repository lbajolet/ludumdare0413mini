package com.ldd.uqam.minicontrapt
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Nicolas
	 */
	public class SecondPlayer extends FlxSprite
	{
		public function SecondPlayer(x:int, y:int) 
		{
			this.makeGraphic(10, 10, 0xffff1111);
			this.maxVelocity.y = 200;
			this.acceleration.y = 200;
			this.x = x;
			this.y = y;
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}

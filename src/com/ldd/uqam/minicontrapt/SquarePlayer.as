package com.ldd.uqam.minicontrapt
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Nicolas
	 */
	public class SquarePlayer extends FlxSprite
	{
		private var positionY :int;
		private var enSaut : Boolean;
		private var temp :int;
		public function SquarePlayer(x:int, y:int) 
		{
			this.makeGraphic(10, 10, 0xffff8762);
			this.maxVelocity.y = 200;
			this.acceleration.y = 200;
			this.x = x;
			this.y = y;
			enSaut = true;
		}
		
		override public function update():void
		{
			if (FlxG.keys.LEFT)
			{
			  this.x = this.x -2;
			}

			if (FlxG.keys.RIGHT)
			{
			  this.x = this.x +2;
			}
			
			if (FlxG.keys.justPressed("UP") && enSaut == false)
			{
				enSaut = true
				this.acceleration.y = 200;
				this.maxVelocity.y = -90;
			}
			if (this.y < positionY - 15 && enSaut == true)
			{
				this.maxVelocity.y = 400;
			}
			
			if (this.isTouching(FLOOR) == true) {
				this.acceleration.y = 0;
				this.maxVelocity.y = 0;
				enSaut = false;
				positionY = this.y;
			}
			if (this.isTouching(FLOOR) == false && enSaut == false) {
				this.acceleration.y = 300;
				this.maxVelocity.y = 300;
				//enSaut = true;
			}
			
			if (this.isTouching(UP)) {
				this.maxVelocity.y = 400;
			}
			super.update();
		}
	}
}

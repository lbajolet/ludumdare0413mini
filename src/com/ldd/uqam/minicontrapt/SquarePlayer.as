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
			//positionY = 320;//this.y;
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
			
			if (FlxG.keys.justPressed("SPACE") && enSaut == false)
			{
				//positionY = this.y;
				enSaut = true
				this.acceleration.y = 110;
				this.maxVelocity.y = -200;
			}
			if (this.y < positionY - 10 && enSaut == true)
			{
				this.maxVelocity.y = 100;
			}
			
			if (this.isTouching(FLOOR) == true) {
				this.acceleration.y = 0;
				this.maxVelocity.y = 0;
				enSaut = false;
				positionY = this.y;
			}
			if (this.isTouching(FLOOR) == false && enSaut == false) {
				this.acceleration.y = 80;
				this.maxVelocity.y = 100;
				//enSaut = true;
			}
			if (this.isTouching(WALL) == true) {
				positionY = this.y;
				enSaut = false;
			}
			super.update();
		}
	}

}
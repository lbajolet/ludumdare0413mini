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
			this.maxVelocity.y = 80;
			this.acceleration.y = 20;
			this.x = x;
			this.y = y;
			enSaut = true;
			//positionY = 320;//this.y;
		}
		
		override public function update():void
		{
			if (FlxG.keys.LEFT)
			{
				FlxG.worldBounds.x = 10;
			  this.x--;
			  
			}

			if (FlxG.keys.RIGHT)
			{
				FlxG.worldBounds.x = -10;
			  this.x++;
			  
			}
			
			if (FlxG.keys.justPressed("SPACE") && enSaut == false)
			{
				positionY = this.y;
				enSaut = true
				this.acceleration.y = 20;
				this.maxVelocity.y = -100;
			}
			if (this.y < positionY - 20 && enSaut == true)
			{
				this.maxVelocity.y = 100;
			}
			
			if (this.isTouching(FLOOR) == true) {
				this.acceleration.y = 0;
				this.maxVelocity.y = 0;
				enSaut = false;
				//positionY = this.y;
			}
			if (this.isTouching(FLOOR) == false && enSaut == false) {
				this.acceleration.y = 20;
				this.maxVelocity.y = 100;
				//enSaut = true;
			}
			if (this.isTouching(WALL) == true) {
				//positionY = this.y;
				enSaut = false;
			}
			super.update();
		}
	}

}
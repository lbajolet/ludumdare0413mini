package com.ldd.uqam.minicontrapt
{
	import org.flixel.*;
	import org.flixel.plugin.TimerManager;
	/**
	 * ...
	 * @author Nicolas
	 */
	public class SquarePlayer extends FlxSprite
	{
		[Embed(source = "../../../../../Assets/Sounds/jump.mp3")] private var jmpSound: Class;
		[Embed(source = "../../../../../Assets/Sounds/Death.mp3")] private var deathSound: Class;
		
		private var positionY :int;
		private var enSaut : Boolean;
		private var temp :int;
		
		private var x_spawn:int;
		private var y_spawn:int;
		
		private var wall_touched_last_time: uint;
		
		private var timerToWalljump:FlxTimer;
		
		public function SquarePlayer(x:int, y:int) 
		{
			this.makeGraphic(10, 10, 0xffff8762);
			this.maxVelocity.y = 450;
			this.acceleration.y = 200;
			this.x = x;
			this.y = y;
			enSaut = true;
			timerToWalljump = new FlxTimer();
			timerToWalljump.start(1, 1);
			this.x_spawn = x;
			this.y_spawn = y;
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
			
			if (this.y < positionY - 15 && enSaut)
			{
				this.maxVelocity.y = 400;
			}
			
			if (!this.isTouching(FLOOR) && enSaut) {
				this.acceleration.y = 400;
				this.maxVelocity.y = 450;
			}
			
			if (this.isTouching(FLOOR)) {
				enSaut = false;
				positionY = this.y;
				if (FlxG.keys.UP)
				{
					this.acceleration.y = 400;
					this.velocity.y = 100;
					this.maxVelocity.y = -180;
					enSaut = true;
					FlxG.play(jmpSound);
				}
			}
			
			if (this.isTouching(WALL)) {
				if (FlxG.keys.UP && timerToWalljump.finished) {
					timerToWalljump.start(0.4, 1);
					this.acceleration.y = 400;
					this.maxVelocity.y = -180;
					enSaut = true;
					FlxG.play(jmpSound);
				}
			}
			
			if (this.isTouching(UP)) {
				this.maxVelocity.y = 400;
			}
			super.update();
		}
		
		public function respawn(): void {
			this.x = this.x_spawn;
			this.y = this.y_spawn;
			FlxG.play(deathSound);
		}
	}
}

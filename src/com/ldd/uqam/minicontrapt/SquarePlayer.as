package com.ldd.uqam.minicontrapt
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import org.flixel.*;
	import org.flixel.plugin.TimerManager;
	/**
	 * ...
	 * @author Nicolas
	 */
	public class SquarePlayer extends FlxSprite
	{
		private var positionY :int;
		private var enSaut : Boolean;
		private var temp :int;
		
		private var wall_touched_last_time: uint;
		
		private var timerToWalljump:FlxTimer;
		private var timerForOtherKey:Timer;
		
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
			timerForOtherKey = new Timer(1000, 1);
			timerForOtherKey.addEventListener(TimerEvent.TIMER, wall_jump);
			//timerForOtherKey.start();
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
				}
			}
			
			if (this.isTouching(WALL)) {
				if (FlxG.keys.UP && timerToWalljump.finished) {
					timerToWalljump.start(0.4, 1);
					this.acceleration.y = 400;
					this.maxVelocity.y = -180;
					enSaut = true;
				}
			}
			
			if (this.isTouching(UP)) {
				this.maxVelocity.y = 400;
			}
			super.update();
		}
	}
}

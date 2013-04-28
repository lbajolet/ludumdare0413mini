package com.ldd.uqam.minicontrapt 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author R4PaSs
	 */
	public class CirclePlayer extends FlxSprite
	{
		[Embed(source = '../../../../../Assets/Circle.png')] private var circle_img:Class;
		
		var already_no_accel = false;
		
		public function CirclePlayer(x_pos: int, y_pos: int)
		{
			super(x_pos, y_pos);
			this.loadGraphic(circle_img);
			this.maxVelocity.x = 200;
			this.maxVelocity.y = 400;
			this.angularVelocity = 0;
			this.maxAngular = 500;
		}
		
		override public function update(): void 
		{
			if (this.velocity.x > 0) {
				if (FlxG.keys.RIGHT) {
					this.angularAcceleration = 250;
					this.acceleration.x = 85;
				}else if (FlxG.keys.LEFT) {
					this.angularAcceleration = -400;
					this.acceleration.x = -160;
				}
				already_no_accel = false;
			} else if(velocity.x < 0) {
				if (FlxG.keys.RIGHT) {
					this.angularAcceleration = 400;
					this.acceleration.x = 160;
				}else if (FlxG.keys.LEFT) {
					this.angularAcceleration = -250;
					this.acceleration.x = -85;
				}
				already_no_accel = false;
			} else {
				if (FlxG.keys.RIGHT) {
					this.angularAcceleration = 250;
					this.acceleration.x = 85;
				}else if (FlxG.keys.LEFT) {
					this.angularAcceleration = -250;
					this.acceleration.x = -85;
				}
				already_no_accel = false;
			}
			
			if (already_no_accel) {
				if (velocity.x == 0) {
					this.acceleration.x = 0;
					this.angularAcceleration = 0;
				}
			}
			
			if (!FlxG.keys.LEFT && !FlxG.keys.RIGHT && !already_no_accel) {
				this.acceleration.x = -this.acceleration.x / 2;
				this.angularAcceleration = -this.angularAcceleration / 2;
				already_no_accel = true;
			}
			
			//Map Collision handling
			if (this.isTouching(FLOOR)) {
				this.acceleration.y = 0;
			}else {
				this.acceleration.y = 200;
			}
			if (this.isTouching(WALL)) {
				this.acceleration.x = 0;
				this.angularVelocity = 0;
			}
			
			super.update();
		}
	}
}

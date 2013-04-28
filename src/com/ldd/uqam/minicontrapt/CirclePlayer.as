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
		
		private static var x_accel_touch_same_dir:int = 85;
		private static var angular_accel_touch_same_dir: int = 250;
		private static var x_accel_no_touch_same_dir:int = 20;
		private static var angular_accel_no_touch_same_dir: int = 50;
		
		private static var x_accel_touch_other_dir:int = 170;
		private static var angular_accel_touch_other_dir: int = 500;
		private static var x_accel_no_touch_other_dir:int = 20;
		private static var angular_accel_no_touch_other_dir: int = 50;
		
		private var already_no_accel:Boolean;
		private var in_air: Boolean;
		
		public function CirclePlayer(x_pos: int, y_pos: int)
		{
			super(x_pos, y_pos);
			this.loadGraphic(circle_img);
			this.maxVelocity.x = 200;
			this.maxVelocity.y = 400;
			this.angularVelocity = 0;
			this.maxAngular = 500;
			in_air = false;
			already_no_accel = false;
		}
		
		private function set_accel_when_not_touching(): void {
			if (this.velocity.x > 0) {
				if (FlxG.keys.RIGHT) {
					this.angularAcceleration = angular_accel_no_touch_same_dir;
					this.acceleration.x = x_accel_no_touch_same_dir;
				}else if (FlxG.keys.LEFT) {
					this.angularAcceleration = -angular_accel_no_touch_other_dir;
					this.acceleration.x = -angular_accel_no_touch_other_dir;
				}
			} else if(velocity.x < 0) {
				if (FlxG.keys.RIGHT) {
					this.angularAcceleration = angular_accel_no_touch_other_dir;
					this.acceleration.x = x_accel_no_touch_other_dir;
				}else if (FlxG.keys.LEFT) {
					this.angularAcceleration = -angular_accel_no_touch_same_dir;
					this.acceleration.x = -x_accel_no_touch_same_dir;
				}
			} else {
				if (FlxG.keys.RIGHT) {
					this.angularAcceleration = angular_accel_no_touch_same_dir;
					this.acceleration.x = x_accel_no_touch_same_dir;
				}else if (FlxG.keys.LEFT) {
					this.angularAcceleration = -angular_accel_no_touch_same_dir;
					this.acceleration.x = -x_accel_no_touch_same_dir;
				}
			}
			if (!FlxG.keys.LEFT && !FlxG.keys.RIGHT) {
				this.angularAcceleration = 0;
				this.acceleration.x = 0;
			}
		}
		
		private function set_accel_when_touching(): void {
			if (this.velocity.x > 0) {
				if (FlxG.keys.RIGHT) {
					this.angularAcceleration = angular_accel_touch_same_dir;
					this.acceleration.x = x_accel_touch_same_dir;
				}else if (FlxG.keys.LEFT) {
					this.angularAcceleration = -angular_accel_touch_other_dir;
					this.acceleration.x = -x_accel_touch_other_dir;
				}
			} else if(velocity.x < 0) {
				if (FlxG.keys.RIGHT) {
					this.angularAcceleration = angular_accel_touch_other_dir;
					this.acceleration.x = x_accel_touch_other_dir;
				}else if (FlxG.keys.LEFT) {
					this.angularAcceleration = -angular_accel_touch_same_dir;
					this.acceleration.x = -x_accel_touch_same_dir;
				}
			} else {
				if (FlxG.keys.RIGHT) {
					this.angularAcceleration = angular_accel_touch_same_dir;
					this.acceleration.x = x_accel_touch_same_dir;
				}else if (FlxG.keys.LEFT) {
					this.angularAcceleration = -angular_accel_touch_same_dir;
					this.acceleration.x = -x_accel_touch_same_dir;
				}
			}
			
			if (FlxG.keys.LEFT || FlxG.keys.RIGHT) {
				this.already_no_accel = false;
			}
			
			if (already_no_accel) {
				if (velocity.x < 10 && velocity.x > -10) {
					this.acceleration.x = 0;
					this.angularAcceleration = 0;
				}
			}
			
			if (!FlxG.keys.LEFT && !FlxG.keys.RIGHT && !this.already_no_accel) {
				this.acceleration.x /= -2;
				this.angularAcceleration /= -2;
				this.already_no_accel = true;
			}
		}
		
		override public function update(): void 
		{
			//Map Collision handling
			if (this.isTouching(FLOOR)) {
				this.acceleration.y = 0;
				this.set_accel_when_touching();
			} else {
				this.acceleration.y = 200;
				this.set_accel_when_not_touching();
			}
			if (this.isTouching(WALL)) {
				this.acceleration.x = 0;
				this.angularVelocity = 0;
			}
			
			super.update();
		}
	}
}

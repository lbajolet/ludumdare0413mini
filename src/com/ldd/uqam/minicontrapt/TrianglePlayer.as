package com.ldd.uqam.minicontrapt 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author R4PaSs
	 */
	public class TrianglePlayer extends FlxSprite
	{
		[Embed(source = '../../../../../Assets/Triangle.png')] private var triangle_img:Class;
		
		private static var x_accel_touch_same_dir:int = 85;
		private static var angular_accel_touch_same_dir: int = 250;
		private static var x_accel_no_touch_same_dir:int = 20;
		private static var angular_accel_no_touch_same_dir: int = 50;
		
		private static var x_accel_touch_other_dir:int = 170;
		private static var angular_accel_touch_other_dir: int = 500;
		private static var x_accel_no_touch_other_dir:int = 20;
		private static var angular_accel_no_touch_other_dir: int = 50;
		
		private var auto_decelerating: Boolean = false;
		
		var y_offset: int;
		
		public function TrianglePlayer(x_pos: int, y_pos: int)
		{
			super(x_pos, y_pos);
			this.loadGraphic(triangle_img);
			this.maxVelocity.x = 150;
			this.maxVelocity.y = 600;
			this.angularVelocity = 0;
			this.maxAngular = 500;
		}
		
		public function set_accel_when_touching(): void {
			if (this.velocity.x > 0) {
				if (FlxG.keys.RIGHT) {
					this.angularAcceleration = angular_accel_touch_same_dir;
					this.acceleration.x = x_accel_touch_same_dir;
				}else if (FlxG.keys.LEFT) {
					this.angularAcceleration = -angular_accel_touch_other_dir;
					this.acceleration.x = -x_accel_touch_other_dir;
				}
			} else if (this.velocity.x < 0) {
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
			
			if (FlxG.keys.RIGHT || FlxG.keys.LEFT) {
				this.auto_decelerating = false;
			}
			
			if (!FlxG.keys.RIGHT && !FlxG.keys.LEFT) {
				if (!this.auto_decelerating) {
					this.angularAcceleration = -angular_accel_touch_same_dir;
					this.acceleration.x = -x_accel_touch_same_dir;
					this.auto_decelerating = true;
				}else {
					if (this.velocity.x < 20 && this.velocity.x > -20) {
						this.acceleration.x = 0;
						this.angularAcceleration = 0;
						this.velocity.x = 0;
						this.angularVelocity = 0;
					}
				}
			}
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
		
		function calculate_y_offset(): void {
			var local_angle:int = this.angle % 120;
			if (local_angle < 60) {
				this.y_offset = local_angle / 15;
			} else {
				this.y_offset = local_angle / 15;
			}
		}
		
		override public function update(): void 
		{
			//Collision handling
			if (this.isTouching(FLOOR)) {
				this.acceleration.y = 0;
				this.set_accel_when_touching();
			}else {
				this.set_accel_when_not_touching();
				this.acceleration.y = 200;
			}
			
			if (this.isTouching(WALL)) {
				this.acceleration.x = 0;
				this.velocity.x = 0;
			}
			
			//Setting the current y offset
			var old_y_offset = this.y_offset;
			calculate_y_offset();
			this.y -= this.y_offset - old_y_offset;
			
			super.update();
		}
	}
}

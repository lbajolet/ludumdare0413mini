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
		
		public function TrianglePlayer(x_pos: int, y_pos: int)
		{
			super(x_pos, y_pos);
			this.loadGraphic(triangle_img);
			this.maxVelocity.x = 150;
			this.maxVelocity.y = 600;
			this.angularVelocity = 0;
			this.maxAngular = 500;
		}
		
		override public function update(): void 
		{
			if (FlxG.keys.RIGHT) {
				this.angularAcceleration = 250;
				this.acceleration.x = 35;
			}else if (FlxG.keys.LEFT) {
				this.angularAcceleration = -250;
				this.acceleration.x = -35;
			}
			
			//Collision handling
			if (this.isTouching(FLOOR)) {
				this.acceleration.y = 0;
			}else {
				this.acceleration.y = 200;
			}
			if (this.isTouching(WALL)) {
				this.acceleration.x = 0;
			}
			
			super.update();
		}
	}
}

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
		
		public function CirclePlayer(x_pos: int, y_pos: int)
		{
			super(x_pos, y_pos);
			this.loadGraphic(circle_img);
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

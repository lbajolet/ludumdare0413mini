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
		
		public function TrianglePlayer(x_pos: int, y_pos: int, width: int, height: int)
		{
			super(x_pos, y_pos);
			//Draw triangle
			//this.loadRotatedGraphic(triangle_img, 64, -1, true);
			this.loadGraphic(triangle_img);
			this.maxVelocity.x = 120;
			this.maxVelocity.y = 200;
			this.acceleration.y = 200;
			this.angularVelocity = 0;
			this.maxAngular = 500;
			this.drag.x = this.maxVelocity.x * 4;
		}
		
		override public function update(): void 
		{
			if (FlxG.keys.RIGHT) {
				this.angularAcceleration = 100;
				this.acceleration.x = 35;
			}else if (FlxG.keys.LEFT) {
				this.angularAcceleration = -100;
				this.acceleration.x = -35;
			}
		}
		
	}

}

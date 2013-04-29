package domi
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	public class Circle extends FlxSprite
	{
		[Embed(source = '../Assets/Circle.png')] private var ImgCircle:Class;
		
		protected static const RUN_SPEED:int = 200;
		protected static const GRAVITY:int = 450;
		protected static const JUMP_SPEED:int = 400;
		protected static const ROTATION_SPEED:int = 200;
		
		public function Circle(X:int,Y:int)
		{
			super(X, Y);
			this.loadGraphic(ImgCircle);
			this.maxVelocity.x = RUN_SPEED;
			this.maxVelocity.y = JUMP_SPEED;
			this.acceleration.y = GRAVITY;
			this.drag.x = RUN_SPEED * 2;
			this.maxAngular = ROTATION_SPEED;
		}
		
		override public function update(): void 
		{
			if (FlxG.keys.LEFT)
			{
				acceleration.x = -drag.x;
			}
			else if (FlxG.keys.RIGHT)
			{
				acceleration.x = drag.x;
			}
			else {
				acceleration.x = 0; 
				angularAcceleration = 0;
			}
			
			angularVelocity = 6*this.velocity.x;
			
			super.update();
		}
	}
}

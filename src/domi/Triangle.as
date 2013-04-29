package domi
{
	
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	public class Triangle extends FlxSprite
	{
		
		[Embed(source = '../Assets/Triangle.png')] private var ImgTriangle:Class;

		protected static const GRAVITY:int = 450;
		protected static const RUN_SPEED:int = 100;
		
		public function Triangle(X:int,Y:int):void
		{
			super(X, Y);
			this.loadGraphic(ImgTriangle);
			this.acceleration.y = GRAVITY;
			this.angularVelocity = 0;
		}
		
		public override function update():void
		{
			super.update();
			
			if (FlxG.keys.LEFT)
			{
			}
			else if (FlxG.keys.RIGHT)
			{       
			}
		}
	}
}
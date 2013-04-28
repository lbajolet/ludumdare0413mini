package domi
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	public class Player extends FlxSprite 
	{
		
		[Embed(source='../Assets/helmutguy.png')]public var Helmutguy:Class;
		
		protected static const RUN_SPEED:int = 100;
		protected static const GRAVITY:int = 450;
		protected static const JUMP_SPEED:int = 250;
		
		public function Player(X:int,Y:int):void
		{
			super(X, Y);
			loadGraphic(Helmutguy, true, true);
			addAnimation("walking", [1, 2], 12, true);
			addAnimation("idle", [0]);
			drag.x = RUN_SPEED * 8;
			acceleration.y = GRAVITY;
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = JUMP_SPEED;
		}
		
		public override function update():void
		{
			super.update();
			acceleration.x = 0; 
			
			if (FlxG.keys.LEFT)
			{
				facing = LEFT; 
				acceleration.x = -drag.x;
			}
			else if (FlxG.keys.RIGHT)
			{
				facing = RIGHT;
				acceleration.x = drag.x;                
			}
			
			if(FlxG.keys.justPressed("UP") && !velocity.y)
			{
				velocity.y = -JUMP_SPEED;
			}
			
			if (velocity.x > 0 || velocity.x <0 ) { play("walking"); }
			else if (!velocity.x) { play("idle"); }
		}
	}
}
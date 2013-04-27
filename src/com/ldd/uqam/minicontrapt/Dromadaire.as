package 
{
	/**
	 * ...
	 * @author 
	 */
	
	import org.flixel.*;
	 
	public class Dromadaire extends FlxSprite {
    
        private var _jump:Number;
 
        public function Dromadaire(X:Number, Y:Number, png:Class) {
            super(X,Y,png);
           acceleration.y = 400;
			drag.x = 600;
			drag.y = 600;
			maxVelocity.x = 120;
			maxVelocity.y = 400;
            //load your graphic
        }
        override public function update():void {
 
    //MOVEMENT
			acceleration.x = 0;
			if(FlxG.keys.LEFT)
			{
				facing = LEFT;
				acceleration.x -= drag.x;
			}
			else if(FlxG.keys.RIGHT)
			{
				facing = RIGHT;
				acceleration.x += drag.x;
			}

			if(FlxG.keys.justPressed("X"))
			{
				if((acceleration.y > 0 && isTouching(FLOOR)) || (acceleration.y < 0 && isTouching(CEILING))){
					velocity.y = -acceleration.y / 2;
				}
			}

			if(FlxG.keys.justPressed("G"))
			{
				acceleration.y = -acceleration.y;
			}
 
            super.update();
        }

    }
	}
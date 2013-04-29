package domi
{
	
	import org.flixel.*;
	
	public class AboutState extends BasicState
	{
		
		public function AboutState()
		{
		}
		
		override public function create():void
		{
			imgState = new FlxSprite(0, 0, ImgAboutState);
			super.create();
		}
	}
}
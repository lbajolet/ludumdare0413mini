package domi
{
	import org.flixel.*;
	
	public class BasicState extends FlxState
	{
		[Embed(source = '../Assets/menu/about-state.png')]protected var ImgAboutState:Class;
		[Embed(source = '../Assets/menu/credits-state.png')]protected var ImgCreditsState:Class;
		[Embed(source = '../Assets/menu/back.png')]protected var ImgBack:Class;
		
		protected var imgBack:FlxSprite;
		protected var imgState:FlxSprite;
		
		public function BasicState()
		{
			
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xFFFFFFFF;
			
			imgBack = new FlxSprite(0, 0, ImgBack);
			
			add(imgState);
			add(imgBack);
		}
		
		override public function update():void
		{
			if (FlxG.mouse.justPressed())
			{
				if (imgBack.overlapsPoint(FlxG.mouse.getScreenPosition(), true))
				{
					FlxG.switchState(new MenuState());
				}
			}
		}
	}
}
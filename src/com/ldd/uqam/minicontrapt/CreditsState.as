package com.ldd.uqam.minicontrapt
{
	
	import org.flixel.*;
	
	public class CreditsState extends BasicState
	{
		
		public function CreditsState()
		{
		}
		
		override public function create():void
		{
			imgState = new FlxSprite(0, 0, ImgCreditsState);
			super.create();
		}
	}
}
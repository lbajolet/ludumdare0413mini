package com.ldd.uqam.minicontrapt
{
	
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		
		private static const boutonSpacing:int = 30;
		private static const boutonSize:int = 76;
		
		[Embed(source = '../../../../../Assets/menu/triangle.png')]public var Triangle:Class;
		[Embed(source = '../../../../../Assets/menu/rond.png')]public var Rond:Class;
		[Embed(source = '../../../../../Assets/menu/carre.png')]public var Carre:Class;
		[Embed(source = '../../../../../Assets/menu/game.png')]public var Game:Class;
		[Embed(source = '../../../../../Assets/menu/about.png')]public var About:Class;
		[Embed(source = '../../../../../Assets/menu/credits.png')]public var Credits:Class;
		
		private var imgTriangle:FlxSprite;
		private var imgRond:FlxSprite;
		private var imgCarre:FlxSprite;
		private var txtGame:FlxSprite;
		private var txtAbout:FlxSprite;
		private var txtCredits:FlxSprite;
		
		public function MenuState()
		{
		}
		
		override public function create(): void
		{
			FlxG.stream("../../../../../Assets/Sounds/Goto80_and_the_Uwe_Schenk_Band_-_01_-_Ponky_Fonky_Ferret.mp3", 1, true);
			
			FlxG.bgColor = 0xff000000;
			
			var hPos:int = (FlxG.width - boutonSize) / 2;
			var vPos2:int = (FlxG.height - boutonSize) / 2;
			var vPos1:int = vPos2 - boutonSize - boutonSpacing;
			var vPos3:int = vPos2 + boutonSize + boutonSpacing;
			
			imgTriangle = new FlxSprite(hPos, vPos1, Triangle);
			imgRond = new FlxSprite(hPos, vPos2, Rond);
			imgCarre = new FlxSprite(hPos, vPos3, Carre);
			
			txtGame = new FlxSprite(0, vPos1, Game);
			txtAbout = new FlxSprite(0, vPos2, About);
			txtCredits = new FlxSprite(0, vPos3, Credits);
			
			add(imgTriangle);
			add(imgRond);
			add(imgCarre);
			
			add(txtGame);
			add(txtAbout);
			add(txtCredits);
			
			txtGame.visible = false;
			txtAbout.visible = false;
			txtCredits.visible = false;
		}
		
		override public function update(): void
		{
			checkOverlap(FlxG.mouse.getScreenPosition(), imgTriangle, txtGame);
			checkOverlap(FlxG.mouse.getScreenPosition(), imgRond, txtAbout);
			checkOverlap(FlxG.mouse.getScreenPosition(), imgCarre, txtCredits);
			
			if (FlxG.mouse.justPressed())
			{
				checkClicked(FlxG.mouse.getScreenPosition());
			}
		}
		
		private function checkOverlap(point:FlxPoint, origSprite:FlxSprite, destSprite:FlxSprite): void
		{
			destSprite.visible = origSprite.overlapsPoint(point, true);
		}
		
		private function checkClicked(point:FlxPoint): void
		{
			if (imgTriangle.overlapsPoint(point, true))
			{
				FlxG.switchState(new PlayStateLvl1);
			}
			else if (imgRond.overlapsPoint(point, true))
			{
				FlxG.switchState(new AboutState);
			}
			else if (imgCarre.overlapsPoint(point, true))
			{
				FlxG.switchState(new CreditsState);
			}
		}
	}
}
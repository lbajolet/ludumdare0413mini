package com.ldd.uqam.minicontrapt
{
	import org.flixel.*;
 
	public class PlayStateLvl2 extends FlxState
	{
		public var p1:SquarePlayer;
		public var ascenseur:FlxSprite;
		public var dropSol1:FlxSprite;
		public var dropSol2:FlxSprite;
		public var interrupteur:FlxSprite;
		public var interrupteurOn:FlxSprite;
		public var addPlatform1:FlxSprite;
		public var addPlatform2:FlxSprite;
		public var door:FlxSprite;
		public var staticSprite:FlxSprite;
		
		public var auSol:Boolean = false;
		public var btnActivate:Boolean = false;
		
		[Embed(source = '../../../../../Assets/Level2.png')] private var ImgTiles:Class;
		[Embed(source = '../../../../../Assets/Level2.txt', mimeType = "application/octet-stream")] private var DataMap:Class;
		[Embed(source = '../../../../../Assets/BlackFlag.png')] private var ImgFlag:Class;
		[Embed(source = '../../../../../Assets/button_down.png')] private var ImgBtnDown:Class;
		[Embed(source = '../../../../../Assets/button_up.png')] private var ImgBtnUp:Class;
		[Embed(source = '../../../../../Assets/Door.png')] private var ImgDoor:Class;
		[Embed(source="../../../../../Assets/platformer-lvl-1.jpg")] public static var LevelSprite:Class;
		private var _map:FlxTilemapExt;
		public static var lyrStage:FlxGroup;
		
		override public function create():void
		{	
			FlxG.worldBounds.width = 1500;
			var bg:FlxSprite = new FlxSprite(16, 16, LevelSprite);
            add(bg);
			
			_map = new FlxTilemapExt;
			_map.loadMap(new DataMap, ImgTiles, 16); 
			lyrStage = new FlxGroup;
			var tempFL:Array = new Array("7");
			var tempFR:Array = new Array("6");
			var tempCL:Array = new Array();
			var tempCR:Array = new Array();
			_map.setSlopes(tempFL, tempFR, tempCL, tempCR);
            lyrStage.add(_map);
			_map.immovable = true;
			this.add(lyrStage);
						
			ascenseur = new FlxSprite(255, 160);
			ascenseur.makeGraphic(16, 4, 0xffff8762);
			ascenseur.maxVelocity.y = 0;
			ascenseur.acceleration.y = 0;
			ascenseur.immovable = true;
			this.add(ascenseur);
			
			dropSol1 = new FlxSprite(320, 220);
			dropSol1.makeGraphic(20, 4, 0xffff8762);
			dropSol1.maxVelocity.y = 0;
			dropSol1.acceleration.y = 0;
			add(dropSol1);
			
			dropSol2 = new FlxSprite(360, 190);
			dropSol2.makeGraphic(20, 4, 0xffff8762);
			dropSol2.maxVelocity.y = 0;
			dropSol2.acceleration.y = 0;
			add(dropSol2);
			
			interrupteur = new FlxSprite(535, 88, ImgBtnUp);
			interrupteur.maxVelocity.y = 0;
			interrupteur.acceleration.y = 0;
			interrupteur.immovable = true;
			add(interrupteur);
			
			interrupteurOn = new FlxSprite(535, 92, ImgBtnDown);
			interrupteurOn.maxVelocity.y = 0;
			interrupteurOn.acceleration.y = 0;
			interrupteurOn.immovable = true;
			
			addPlatform1 = new FlxSprite(545, 160);
			addPlatform1.makeGraphic(20, 4, 0xffff8762);
			addPlatform1.maxVelocity.y = 0;
			addPlatform1.acceleration.y = 0;
			addPlatform1.immovable = true;
			
			addPlatform2 = new FlxSprite(605, 160);
			addPlatform2.makeGraphic(20, 4, 0xffff8762);
			addPlatform2.maxVelocity.y = 0;
			addPlatform2.acceleration.y = 0;
			addPlatform2.immovable = true;
			
			staticSprite = new FlxSprite(50, 193, ImgFlag);
			add(staticSprite);
			
			door = new FlxSprite(695, 145, ImgDoor);
			door.maxVelocity.y = 0;
			door.acceleration.y = 0;
			door.immovable = true;
			add(door);
			
			p1 = new SquarePlayer(50,50);
			add(p1);
			
			FlxG.camera.follow(p1, 1);
		}
		
		override public function update():void
		{
			FlxG.collide(p1, _map);
			FlxG.collide(p1, addPlatform1);
			FlxG.collide(p1, addPlatform2);
			
			var activerAsc:Boolean = FlxG.collide(p1, ascenseur);
			var activerDrp1:Boolean = FlxG.collide(p1, dropSol1);
			var activerDrp2:Boolean = FlxG.collide(p1, dropSol2);
			var finNiveau:Boolean = FlxG.collide(p1, door);
			
			if (btnActivate == false) {
				var activerInter:Boolean = FlxG.collide(p1, interrupteur);
			}else {
				FlxG.collide(p1, interrupteurOn);
			}
			
			if (activerAsc == true) {
				ascenseur.immovable = false;
				ascenseur.acceleration.y = 50;
				ascenseur.maxVelocity.y = 100;
			}
			if (activerDrp1 == true) {
				dropSol1.maxVelocity.y = 80;
				dropSol1.acceleration.y = 80;
			}
			if (dropSol1.y > 600)
			{
				dropSol1.y = 220;
				dropSol1.maxVelocity.y = 0;
				dropSol1.velocity.y = 0;
			}
			if (activerDrp2 == true) {
				dropSol2.maxVelocity.y = 80;
				dropSol2.acceleration.y = 80;
			}
			if (dropSol2.y > 600)
			{
				dropSol2.y = 190;
				dropSol2.maxVelocity.y = 0;
				dropSol2.velocity.y = 0;
			}
			if (finNiveau == true) {

			}
			if (activerInter)
			{
				btnActivate = true;
				remove(interrupteur);
				add(interrupteurOn);
				
				add(addPlatform1);
				add(addPlatform2);
			}
			super.update();
		}
	}
}
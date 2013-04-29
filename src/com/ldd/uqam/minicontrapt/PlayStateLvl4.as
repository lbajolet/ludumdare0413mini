package com.ldd.uqam.minicontrapt
{
	import org.flixel.*;
 
	public class PlayStateLvl4 extends FlxState
	{
		public var p1:SquarePlayer;
		public var monster:FlxSprite;
		public var block:FlxSprite;
		public var block2:FlxSprite;
		public var block3:FlxSprite;
		public var interrupteur:FlxSprite;
		public var interrupteurOn:FlxSprite;
		public var btnActivate:Boolean = false;
		public var activateColl:Boolean = false;
		public var dropSol1:FlxSprite;
		public var dropSol2:FlxSprite;
		public var dropSol3:FlxSprite;
		public var dropSol4:FlxSprite;
		public var dropSol5:FlxSprite;
		public var dropSol6:FlxSprite;
		public var dropSol7:FlxSprite;
		public var dropSol8:FlxSprite;
		public var door:FlxSprite;
		public var staticSprite:FlxSprite;
			
		
		[Embed(source = '../../../../../Assets/Level4.png')] private var ImgTiles:Class;
		[Embed(source = '../../../../../Assets/Level4.txt', mimeType = "application/octet-stream")] private var DataMap:Class;
		[Embed(source = '../../../../../Assets/BlackFlag.png')] private var ImgFlag:Class;
		[Embed(source = '../../../../../Assets/button_down.png')] private var ImgBtnDown:Class;
		[Embed(source = '../../../../../Assets/button_up.png')] private var ImgBtnUp:Class;
		[Embed(source = '../../../../../Assets/Door.png')] private var ImgDoor:Class;
		[Embed(source = '../../../../../Assets/monster.png')] private var ImgMonster:Class;
		[Embed(source="../../../../../Assets/Fond4.png")] public static var LevelSprite:Class;
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
			
			block = new FlxSprite(220, 391);
			block.makeGraphic(25, 25, 0xf0000000);
			block.immovable = true;
			add(block);
			
			block2 = new FlxSprite(300, 366);
			block2.makeGraphic(25, 50, 0xf0000000);
			block2.immovable = true;
			add(block2);
			
			block3 = new FlxSprite(410, 356);
			block3.makeGraphic(25, 60, 0xf0000000);
			block3.immovable = true;
			add(block3);
			
			interrupteur = new FlxSprite(680, 410, ImgBtnUp);
			interrupteur.maxVelocity.y = 0;
			interrupteur.acceleration.y = 0;
			interrupteur.immovable = true;
			add(interrupteur);
			
			interrupteurOn = new FlxSprite(680, 414, ImgBtnDown);
			interrupteurOn.maxVelocity.y = 0;
			interrupteurOn.acceleration.y = 0;
			interrupteurOn.immovable = true;
			
			dropSol1 = new FlxSprite(620, 390);
			dropSol1.makeGraphic(20, 4, 0xf0000000);
			dropSol1.maxVelocity.y = 0;
			dropSol1.acceleration.y = 0;
			
			dropSol2 = new FlxSprite(570, 365);
			dropSol2.makeGraphic(20, 4, 0xf0000000);
			dropSol2.maxVelocity.y = 0;
			dropSol2.acceleration.y = 0;
			
			dropSol3 = new FlxSprite(615, 340);
			dropSol3.makeGraphic(20, 4, 0xf0000000);
			dropSol3.maxVelocity.y = 0;
			dropSol3.acceleration.y = 0;
			
			dropSol4 = new FlxSprite(570, 310);
			dropSol4.makeGraphic(20, 4, 0xf0000000);
			dropSol4.maxVelocity.y = 0;
			dropSol4.acceleration.y = 0;
			
			dropSol5 = new FlxSprite(598, 275);
			dropSol5.makeGraphic(20, 4, 0xf0000000);
			dropSol5.maxVelocity.y = 0;
			dropSol5.acceleration.y = 0;
			
			dropSol6 = new FlxSprite(570, 245);
			dropSol6.makeGraphic(20, 4, 0xf0000000);
			dropSol6.maxVelocity.y = 0;
			dropSol6.acceleration.y = 0;
			
			dropSol7 = new FlxSprite(598, 210);
			dropSol7.makeGraphic(20, 4, 0xf0000000);
			dropSol7.maxVelocity.y = 0;
			dropSol7.acceleration.y = 0;
			
			dropSol8 = new FlxSprite(570, 180);
			dropSol8.makeGraphic(20, 4, 0xf0000000);
			dropSol8.maxVelocity.y = 0;
			dropSol8.acceleration.y = 0;
			
			monster = new FlxSprite(-320, 335, ImgMonster);
			monster.maxVelocity.x = 50;
			monster.acceleration.x = 20;
			monster.immovable = true;
			this.add(monster);
			
			staticSprite = new FlxSprite(30, 405, ImgFlag);
			add(staticSprite);
			
			door = new FlxSprite(695, 145, ImgDoor);
			door.maxVelocity.y = 0;
			door.acceleration.y = 0;
			door.immovable = true;
			add(door);
			
			p1 = new SquarePlayer(50,350);
			add(p1);
			
			FlxG.camera.zoom = 2;
			FlxG.camera.follow(p1, 2);
		}
		
		override public function update():void
		{
			var activerDrp1:Boolean;
			var activerDrp2:Boolean;
			var activerDrp3:Boolean;
			var activerDrp4:Boolean;
			var activerDrp5:Boolean;
			var activerDrp6:Boolean;
			var activerDrp7:Boolean;
			var activerDrp8:Boolean;
			var finNiveau:Boolean;
			
			var activerDrp1P2:Boolean;
			var activerDrp2P2:Boolean;;
			
			FlxG.collide(p1, _map);
			FlxG.collide(p1, block);
			FlxG.collide(p1, block2);
			FlxG.collide(p1, block3);
			var killByMonster:Boolean = FlxG.collide(p1, monster);
			
			if (FlxG.collide(p1, door)) {
				//FlxG.switchState(new PlayStateLvl5);
				//End of game
			}
			
			if (btnActivate == false) {
				var activerInter:Boolean = FlxG.collide(p1, interrupteur);
			}else {
				FlxG.collide(p1, interrupteurOn);
			}
			
			if (activerInter == true)
			{
				btnActivate = true;
				activateColl = true;
				remove(interrupteur);
				add(interrupteurOn);

				add(dropSol1);
				add(dropSol2);
				add(dropSol3);
				add(dropSol4);
				add(dropSol5);
				add(dropSol6);
				add(dropSol7);
				add(dropSol8);
			}
			
			if (activateColl == true) {
				activerDrp1 = FlxG.collide(p1, dropSol1);
				activerDrp2 = FlxG.collide(p1, dropSol2);
				activerDrp3 = FlxG.collide(p1, dropSol3);
				activerDrp4 = FlxG.collide(p1, dropSol4);
				activerDrp5 = FlxG.collide(p1, dropSol5);
				activerDrp6 = FlxG.collide(p1, dropSol6);
				activerDrp7 = FlxG.collide(p1, dropSol7);
				activerDrp8 = FlxG.collide(p1, dropSol8);
			}
			
			if (activerDrp1 == true) {
				dropSol1.maxVelocity.y = 80;
				dropSol1.acceleration.y = 80;
			}
			if (activerDrp2 == true) {
				dropSol2.maxVelocity.y = 80;
				dropSol2.acceleration.y = 80;
			}
			if (activerDrp3 == true) {
				dropSol3.maxVelocity.y = 80;
				dropSol3.acceleration.y = 80;
			}
			if (activerDrp4 == true) {
				dropSol4.maxVelocity.y = 80;
				dropSol4.acceleration.y = 80;
			}
			if (activerDrp5 == true) {
				dropSol5.maxVelocity.y = 80;
				dropSol5.acceleration.y = 80;
			}
			if (activerDrp6 == true) {
				dropSol6.maxVelocity.y = 80;
				dropSol6.acceleration.y = 80;
			}
			if (activerDrp7 == true) {
				dropSol7.maxVelocity.y = 80;
				dropSol7.acceleration.y = 80;
			}
			if (activerDrp8 == true) {
				dropSol8.maxVelocity.y = 80;
				dropSol8.acceleration.y = 80;
			}
			
			if (dropSol1.y > 600)
			{
				dropSol1.y = 390;
				dropSol1.x = 620;
				dropSol1.maxVelocity.y = 0;
				dropSol1.velocity.y = 0;
			}
			if (dropSol2.y > 600)
			{
				dropSol2.y = 365;
				dropSol2.x = 570;
				dropSol2.maxVelocity.y = 0;
				dropSol2.velocity.y = 0;
			}
			if (dropSol3.y > 600)
			{
				dropSol3.y = 340;
				dropSol3.x = 615;
				dropSol3.maxVelocity.y = 0;
				dropSol3.velocity.y = 0;
			}
			if (dropSol4.y > 600)
			{
				dropSol4.y = 310;
				dropSol4.x = 570;
				dropSol4.maxVelocity.y = 0;
				dropSol4.velocity.y = 0;
			}
			if (dropSol5.y > 600)
			{
				dropSol5.y = 275;
				dropSol5.x = 598;
				dropSol5.maxVelocity.y = 0;
				dropSol5.velocity.y = 0;
			}
			if (dropSol6.y > 600)
			{
				dropSol6.y = 245;
				dropSol6.x = 570;
				dropSol6.maxVelocity.y = 0;
				dropSol6.velocity.y = 0;
			}
			if (dropSol7.y > 600)
			{
				dropSol7.y = 210;
				dropSol7.x = 598;
				dropSol7.maxVelocity.y = 0;
				dropSol7.velocity.y = 0;
			}
			if (dropSol8.y > 600)
			{
				dropSol8.y = 180;
				dropSol8.x = 570;
				dropSol8.maxVelocity.y = 0;
				dropSol8.velocity.y = 0;
			}
			
			
			if (monster.x >= 400) {
				monster.maxVelocity.x = 0;
			}
			
			if (killByMonster == true) {
				p1.respawn();
				monster.x = -320;
				monster.y = 335;
			}
			super.update();
		}
	}
}

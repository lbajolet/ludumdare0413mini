package com.ldd.uqam.minicontrapt 
{
	/**
	 * ...
	 * @author Nicolas
	 */
	import mx.core.FlexApplicationBootstrap;
	import org.flixel.*;
	import org.flixel.plugin.*;
	import org.flixel.plugin.photonstorm.FlxCollision;
	 
	public class PlayStateLvl1 extends FlxState
	{
		public var p1:SquarePlayer;
		public var interrupteur:FlxSprite;
		public var interrupteurOn:FlxSprite;
		public var door:FlxSprite;
		public var staticSprite:FlxSprite;
		public var platform1:FlxSprite;
		public var platform2:FlxSprite;
		public var platform3:FlxSprite;
		public var dropSol1:FlxSprite;
		public var dropSol2:FlxSprite;
		public var dropSol3:FlxSprite;
		private var deathLine: FlxGroup;
		public var descD:FlxSprite;
		public var descG:FlxSprite;
		public var btnActivate:Boolean = false;
		public var help1:FlxSprite;
		public var help2:FlxSprite;
		public var help3:FlxSprite;
		public var help4:FlxSprite;
		public var help5:FlxSprite;
		
		[Embed(source = '../../../../../Assets/Level1.png')] private var ImgTiles:Class;
		[Embed(source = '../../../../../Assets/Level1.txt', mimeType = "application/octet-stream")] private var DataMap:Class;
		[Embed(source = '../../../../../Assets/BlackFlag.png')] private var ImgFlag:Class;
		[Embed(source = '../../../../../Assets/button_down.png')] private var ImgBtnDown:Class;
		[Embed(source = '../../../../../Assets/button_up.png')] private var ImgBtnUp:Class;
		[Embed(source = '../../../../../Assets/Door.png')] private var ImgDoor:Class;
		[Embed(source = "../../../../../Assets/Fond1.png")] public static var LevelSprite:Class;
		[Embed(source = "../../../../../Assets/Press_button.png")] public static var Help1:Class;
		[Embed(source = "../../../../../Assets/DoorH.png")] public static var Help2:Class;
		[Embed(source = "../../../../../Assets/Jumppppp.png")] public static var Help3:Class;
		[Embed(source = "../../../../../Assets/platform.png")] public static var Help4:Class;
		[Embed(source="../../../../../Assets/wall_jumping.png")] public static var Help5:Class;
		private var _map:FlxTilemapExt;
		
		public static var lyrStage:FlxGroup;

		override public function create():void
		{
			FlxG.worldBounds.width = 3000;
			var bg:FlxSprite = new FlxSprite(16, 16, LevelSprite);
            add(bg);
			
			help1 = new FlxSprite(120, 0, Help1);
			help1.scale.x = 0.3;
			help1.scale.y = 0.3;
			add(help1);
			
			help2 = new FlxSprite(650, -100, Help2);
			help2.scale.x = 0.3;
			help2.scale.y = 0.3;
			add(help2);
			
			help3 = new FlxSprite(-100, 0, Help3);
			help3.scale.x = 0.3;
			help3.scale.y = 0.3;
			add(help3);
			
			help4 = new FlxSprite(470, -100, Help4);
			help4.scale.x = 0.3;
			help4.scale.y = 0.3;
			add(help4);
			
			help5 = new FlxSprite(300, -50, Help5);
			help5.scale.x = 0.3;
			help5.scale.y = 0.3;
			add(help5);
			
			_map = new FlxTilemapExt;
			_map.loadMap(new DataMap, ImgTiles,16); 
			lyrStage = new FlxGroup;
			
			var tempFL:Array = new Array("7");
			var tempFR:Array = new Array("6");
			var tempCL:Array = new Array();
			var tempCR:Array = new Array();
		
			_map.setSlopes(tempFL, tempFR, tempCL, tempCR);

            lyrStage.add(_map);
			_map.immovable = true;
			this.add(lyrStage);
			
			interrupteur = new FlxSprite(400, 392, ImgBtnUp);
			interrupteur.maxVelocity.y = 0;
			interrupteur.acceleration.y = 0;
			interrupteur.immovable = true;
			add(interrupteur);
			
			interrupteurOn = new FlxSprite(400, 397, ImgBtnDown);
			interrupteurOn.maxVelocity.y = 0;
			interrupteurOn.acceleration.y = 0;
			interrupteurOn.immovable = true;
			
			staticSprite = new FlxSprite(30, 388, ImgFlag);
			add(staticSprite);
			
			door = new FlxSprite(1010, 190, ImgDoor);
			door.immovable = true;
			add(door);
			
			platform1 = new FlxSprite(300, 370);
			platform1.makeGraphic(20, 4, 0xf0000000);
			platform1.immovable = true;
			
			platform2 = new FlxSprite(350, 350);
			platform2.makeGraphic(20, 4, 0xf0000000);
			platform2.immovable = true;
			
			platform3 = new FlxSprite(400, 330);
			platform3.makeGraphic(20, 4, 0xf0000000);
			platform3.immovable = true;
			
			dropSol1 = new FlxSprite(780, 280);
			dropSol1.makeGraphic(20, 4, 0xf0000000);
			dropSol1.maxVelocity.y = 0;
			dropSol1.acceleration.y = 0;
			add(dropSol1);
			
			dropSol2 = new FlxSprite(830, 250);
			dropSol2.makeGraphic(20, 4, 0xf0000000);
			dropSol2.maxVelocity.y = 0;
			dropSol2.acceleration.y = 0;
			add(dropSol2);
			
			dropSol3 = new FlxSprite(880, 220);
			dropSol3.makeGraphic(20, 4, 0xf0000000);
			dropSol3.maxVelocity.y = 0;
			dropSol3.acceleration.y = 0;
			add(dropSol3);
			
			this.deathLine = RedSquareOfDeath.create_death_line(2400, 464);
			
			//this.deathLine.add(new RedSquareOfDeath(100, 280));
			
			add(this.deathLine);
			
			
			p1 = new SquarePlayer(20, 20);
			add(p1);
			
			FlxG.camera.setBounds(0, 0, _map.width, _map.height, true);
			FlxG.camera.follow(p1, FlxCamera.STYLE_PLATFORMER);
			
		
		}
		
		override public function update():void
		{
			if (FlxG.collide(p1, deathLine)) {
				p1.kill();
			}
			
			FlxG.collide(p1, _map);
			
			var activerDrp1:Boolean = FlxG.collide(p1, dropSol1);
			var activerDrp2:Boolean = FlxG.collide(p1, dropSol2);
			var activerDrp3:Boolean = FlxG.collide(p1, dropSol3);
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
			if (dropSol1.y > 500)
			{
				dropSol1.y = 280;
				dropSol1.x = 780;
				dropSol1.maxVelocity.y = 0;
				dropSol1.velocity.y = 0;
			}
			if (dropSol2.y > 500)
			{
				dropSol2.y = 250;
				dropSol2.x = 830;
				dropSol2.maxVelocity.y = 0;
				dropSol2.velocity.y = 0;
			}
			if (dropSol3.y > 500)
			{
				dropSol3.y = 220;
				dropSol3.x = 880;
				dropSol3.maxVelocity.y = 0;
				dropSol3.velocity.y = 0;
			}
			
			if (btnActivate == false) {
				var activerInter:Boolean = FlxG.collide(p1, interrupteur);
			}else {
				FlxG.collide(p1, platform1);
				FlxG.collide(p1, platform2);
				FlxG.collide(p1, platform3);
			}
			
			if (FlxG.collide(p1, this.door)) {
				FlxG.switchState(new PlayStateLvl2);
			}
			
			if (activerInter == true)
			{
				btnActivate = true;
				add(platform1);
				add(platform2);
				add(platform3);
				remove(interrupteur);
				add(interrupteurOn);
			}
			
			if (platform1.x >= 1605) {
				platform1.maxVelocity.x = -80;
			}else if (platform1.x <= 1390) {
				platform1.maxVelocity.x = 80;
			}
			super.update();
		}
		
	}

}

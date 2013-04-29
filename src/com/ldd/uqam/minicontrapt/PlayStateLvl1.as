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
		public var p1:CirclePlayer;
		//public var p2:TrianglePlayer;
		public var interrupteur:FlxSprite;
		public var interrupteurOn:FlxSprite;
		public var door:FlxSprite;
		public var staticSprite:FlxSprite;
		public var platform1:FlxSprite;
		public var descD:FlxSprite;
		public var descG:FlxSprite;
		public var btnActivate:Boolean = false;
		
		[Embed(source = '../../../../../Assets/Level1tileSet.png')] private var ImgTiles:Class;
		[Embed(source = '../../../../../Assets/Level1Map.txt', mimeType = "application/octet-stream")] private var DataMap:Class;
		[Embed(source = '../../../../../Assets/BlackFlag.png')] private var ImgFlag:Class;
		[Embed(source = '../../../../../Assets/button_down.png')] private var ImgBtnDown:Class;
		[Embed(source = '../../../../../Assets/button_up.png')] private var ImgBtnUp:Class;
		[Embed(source = '../../../../../Assets/Door.png')] private var ImgDoor:Class;
		[Embed(source = '../../../../../Assets/descenteDroite.png')] private var DescD:Class;
		[Embed(source="../../../../../Assets/descenteGauche.png")] public static var DescG:Class;
		[Embed(source="../../../../../Assets/platformer-lvl-1.jpg")] public static var LevelSprite:Class;
		private var _map:FlxTilemapExt;
		
		public static var lyrStage:FlxGroup;

		override public function create():void
		{
			FlxG.worldBounds.width = 3000;
			var bg:FlxSprite = new FlxSprite(0, -20, LevelSprite);
            add(bg);
			FlxG.bgColor = 0xffffffff;

			_map = new FlxTilemapExt;
			_map.loadMap(new DataMap, ImgTiles,16); 
			lyrStage = new FlxGroup;
			
			var tempFL:Array = new Array(3,4,8,16,24);
			var tempFR:Array = new Array(2,5,9,17,25,10,18,11);
			var tempCL:Array = new Array();
			var tempCR:Array = new Array();
		
			_map.setSlopes(tempFL, tempFR, tempCL, tempCR);

            lyrStage.add(_map);
			_map.immovable = true;
			this.add(lyrStage);

			interrupteur = new FlxSprite(1700, 360, ImgBtnUp);
			interrupteur.maxVelocity.y = 0;
			interrupteur.acceleration.y = 0;
			interrupteur.immovable = true;
			add(interrupteur);
			
			interrupteurOn = new FlxSprite(1700, 364, ImgBtnDown);
			interrupteurOn.maxVelocity.y = 0;
			interrupteurOn.acceleration.y = 0;
			interrupteurOn.immovable = true;
			
			staticSprite = new FlxSprite(30, 320, ImgFlag);
			add(staticSprite);
			
			door = new FlxSprite(2300, 415, ImgDoor);
			door.maxVelocity.y = 0;
			door.acceleration.y = 0;
			door.immovable = true;
			add(door);
			
			platform1 = new FlxSprite(1605, 367);
			platform1.makeGraphic(40, 4, 0xffff8762);
			platform1.maxVelocity.x = 0;
			platform1.acceleration.x = 20;
			platform1.immovable = true;
			
			//descG = new FlxSprite(320, 368, DescG);
			//descG.immovable = true;
			//add(descG);
			
			//descD = new FlxSprite(288, 368, DescD);
			//descD.immovable = true;
			//add(descD);
			
			p1 = new CirclePlayer(0, 0);
			add(p1);
			
			//p2 = new TrianglePlayer(20, 0);
			//add(p2);
			
			FlxG.camera.setBounds(0, 0, _map.width, _map.height, true);
			FlxG.camera.follow(p1, FlxCamera.STYLE_PLATFORMER);
			
		
		}
		
		override public function update():void
		{
			FlxG.collide(p1, _map);
			//FlxG.collide(p1, p2);
			//FlxG.collide(p2, _map);
			//FlxCollision.pixelPerfectCheck(p1, descD);
			//FlxCollision.pixelPerfectCheck(p1, descG);
			
			if (btnActivate == false) {
				var activerInter:Boolean = FlxG.collide(p1, interrupteur);
			}else {
				FlxG.collide(p1, platform1);
			}
			
			if (activerInter == true)
			{
				btnActivate = true;
				add(platform1)
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

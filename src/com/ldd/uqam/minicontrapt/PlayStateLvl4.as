package com.ldd.uqam.minicontrapt
{
	import org.flixel.*;
 
	public class PlayStateLvl4 extends FlxState
	{
		public var p1:SquarePlayer;
		public var p2:SecondPlayer;
		public var monster:FlxSprite;
		
		[Embed(source = '../../../../../Assets/Level4.png')] private var ImgTiles:Class;
		[Embed(source = '../../../../../Assets/Level4.txt', mimeType = "application/octet-stream")] private var DataMap:Class;
		[Embed(source = '../../../../../Assets/BlackFlag.png')] private var ImgFlag:Class;
		[Embed(source = '../../../../../Assets/button_down.png')] private var ImgBtnDown:Class;
		[Embed(source = '../../../../../Assets/button_up.png')] private var ImgBtnUp:Class;
		[Embed(source = '../../../../../Assets/Door.png')] private var ImgDoor:Class;
		[Embed(source = '../../../../../Assets/monster.png')] private var ImgMonster:Class;
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
			
			monster = new FlxSprite(-300, 335, ImgMonster);
			monster.maxVelocity.x = 50;
			monster.acceleration.x = 20;
			monster.immovable = true;
			this.add(monster);
			
			p1 = new SquarePlayer(50,350);
			add(p1);
			
			p2 = new SecondPlayer(255,50);
			add(p2);
			
			FlxG.camera.follow(p1, 1);
		}
		
		override public function update():void
		{
			var activerAsc:Boolean;
			var activerDrp1:Boolean;
			var activerDrp2:Boolean;
			var finNiveau:Boolean;
			
			var activerDrp1P2:Boolean;
			var activerDrp2P2:Boolean;;
			
			FlxG.collide(p1, _map);
			FlxG.collide(p2, _map);
			FlxG.collide(p1, p2);
			var killByMonster:Boolean = FlxG.collide(p1, monster);
			
			if (monster.x >= 400) {
				monster.maxVelocity.x = 0;
			}
			if (killByMonster == true) {
				p1.x = 40;
				p1.y = 40;
			}
			super.update();
		}
	}
}

package com.ldd.uqam.minicontrapt
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import mx.core.FlexSprite;
	import org.flixel.*;
 
	public class PlayStateLvl5 extends FlxState
	{
		public var p1:SquarePlayer;
		public var door:FlxSprite;
		public var staticSprite:FlxSprite;
		public var monster1: FlxSprite;
		private var monster1_dir: Boolean;
		public var monster2: FlxSprite;
		private var monster2_dir: Boolean;
		public var monster3: FlxSprite;
		private var monster3_dir: Boolean;
		public var interrupteur:FlxSprite;
		public var interrupteurOn:FlxSprite;
		public var btnActivate:Boolean = false;
		public var wall:FlxSprite;
		public var monstertimer: Timer;
		
		[Embed(source = '../../../../../Assets/Level5.png')] private var ImgTiles:Class;
		[Embed(source = '../../../../../Assets/Level5.txt', mimeType = "application/octet-stream")] private var DataMap:Class;
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
			
			staticSprite = new FlxSprite(40, 98, ImgFlag);
			add(staticSprite);
			
			door = new FlxSprite(525, 45, ImgDoor);
			door.maxVelocity.y = 0;
			door.acceleration.y = 0;
			door.immovable = true;
			add(door);
			
			wall = new FlxSprite(400, 20);
			wall.makeGraphic(10, 92, 0xf0000000);
			wall.immovable = true;
			add(wall);
			
			interrupteur = new FlxSprite(20, 458, ImgBtnUp);
			interrupteur.maxVelocity.y = 0;
			interrupteur.acceleration.y = 0;
			interrupteur.immovable = true;
			add(interrupteur);
			
			interrupteurOn = new FlxSprite(20, 462, ImgBtnDown);
			interrupteurOn.maxVelocity.y = 0;
			interrupteurOn.acceleration.y = 0;
			interrupteurOn.immovable = true;
			
			monster1 = new FlxSprite(340, 130);
			monster1.makeGraphic(16, 16, 0xfff11111);
			monster1.maxVelocity.y = 0;
			monster1.acceleration.y = 0;
			monster1.immovable = true;
			this.add(monster1);
			
			monster2 = new FlxSprite(385, 285);
			monster2.makeGraphic(16, 16, 0xfff11111);
			monster2.maxVelocity.y = 0;
			monster2.acceleration.y = 0;
			monster2.immovable = true;
			this.add(monster2);
			
			monster3 = new FlxSprite(20, 360);
			monster3.makeGraphic(16, 16, 0xfff11111);
			monster3.maxVelocity.x = 0;
			monster3.acceleration.x = 0;
			monster3.immovable = true;
			this.add(monster3);
			
			this.monstertimer = new Timer(25);
			this.monstertimer.addEventListener(TimerEvent.TIMER, update_monsters);
			this.monstertimer.start();
			
			p1 = new SquarePlayer(40,40);
			add(p1);
			
			FlxG.camera.follow(p1, 1);
		}
		
		private function update_monsters(e:TimerEvent):void {
			if (monster1_dir) {
				monster1.y += 4;
			}else {
				monster1.y -= 4;
			}
			if (monster1.y >= 280) {
				monster1_dir = false;
			}else if (monster1.y <= 130) {
				monster1_dir = true;
			}
			
			if (monster2_dir) {
				monster2.y += 4;
			}else {
				monster2.y -= 4;
			}
			if (monster2.y >= 285) {
				monster2_dir = false;
			}else if (monster2.y <= 130) {
				monster2_dir = true;
			}
			
			if (monster3_dir) {
				monster3.x += 4;
			}else {
				monster3.x -= 4;
			}
			if (monster3.x >= 440) {
				monster3_dir = false;
			}else if (monster3.x <= 20) {
				monster3_dir = true;
			}
		}
		
		override public function update():void
		{
			FlxG.collide(p1, _map);
			
			var finLvl : Boolean = FlxG.collide(p1, door);
			var mort1 :Boolean = FlxG.collide(p1, monster1);
			var mort2 :Boolean = FlxG.collide(p1, monster2);
			var mort3 :Boolean = FlxG.collide(p1, monster3);
			
			if (mort1 == true || mort2 == true || mort3 == true) {
				p1.x = 40;
				p1.y = 40;
				add(wall);
				add(interrupteur)
				remove(interrupteurOn);
				btnActivate = false;
			}
			
			if (btnActivate == false) {
				FlxG.collide(p1, wall);
				var activerInter:Boolean = FlxG.collide(p1, interrupteur);
			}else {
				FlxG.collide(p1, interrupteurOn);
			}
			
			if (activerInter == true)
			{
				btnActivate = true;
				remove(interrupteur);
				remove(wall);
				add(interrupteurOn);
			}
			
			if (finLvl == true) {
				FlxG.switchState(new PlayStateLvl4);
			}
			super.update();
		}
	}
}

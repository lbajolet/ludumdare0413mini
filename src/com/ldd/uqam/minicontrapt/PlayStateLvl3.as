package com.ldd.uqam.minicontrapt
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import mx.core.FlexSprite;
	import org.flixel.*;
 
	public class PlayStateLvl3 extends FlxState
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
		public var monster4: FlxSprite;
		private var monster4_dir: Boolean;
		public var monster5: FlxSprite;
		private var monster5_dir: Boolean;
		public var monster6: FlxSprite;
		private var monster6_dir: Boolean;
		
		public var platforme1:FlxSprite;
		public var platforme2:FlxSprite;
		public var monstertimer: Timer;
		
		private var deathLine: FlxGroup;
		
		[Embed(source = '../../../../../Assets/Level3.png')] private var ImgTiles:Class;
		[Embed(source = '../../../../../Assets/Level3.txt', mimeType = "application/octet-stream")] private var DataMap:Class;
		[Embed(source = '../../../../../Assets/BlackFlag.png')] private var ImgFlag:Class;
		[Embed(source = '../../../../../Assets/button_down.png')] private var ImgBtnDown:Class;
		[Embed(source = '../../../../../Assets/button_up.png')] private var ImgBtnUp:Class;
		[Embed(source = '../../../../../Assets/Door.png')] private var ImgDoor:Class;
		[Embed(source="../../../../../Assets/Fond3.png")] public static var LevelSprite:Class;
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
			
			staticSprite = new FlxSprite(30, 385, ImgFlag);
			add(staticSprite);
			
			door = new FlxSprite(1020, 385, ImgDoor);
			door.maxVelocity.y = 0;
			door.acceleration.y = 0;
			door.immovable = true;
			add(door);
			
			this.deathLine = RedSquareOfDeath.create_death_line(1030, 463);
			add(this.deathLine);

			platforme1 = new FlxSprite(745, 390);
			
			platforme1.makeGraphic(15, 5, 0xf0000000);
			platforme1.immovable = true;
			this.add(platforme1);
			
			platforme2 = new FlxSprite(850, 390);
			platforme2.makeGraphic(15, 5, 0xf0000000);
			platforme2.immovable = true;
			this.add(platforme2);
			
			monster1 = new FlxSprite(200, 384);
			monster1.makeGraphic(16, 16, 0xfff11111);
			monster1.maxVelocity.y = 0;
			monster1.acceleration.y = 0;
			monster1.immovable = true;
			this.add(monster1);
			
			monster2 = new FlxSprite(300, 320);
			monster2.makeGraphic(16, 16, 0xfff11111);
			monster2.maxVelocity.y = 0;
			monster2.acceleration.y = 0;
			monster2.immovable = true;
			this.add(monster2);
			
			monster3 = new FlxSprite(400, 370);
			monster3.makeGraphic(16, 16, 0xfff11111);
			monster3.maxVelocity.y = 0;
			monster3.acceleration.y = 0;
			monster3.immovable = true;
			this.add(monster3);
			
			monster4 = new FlxSprite(500, 330);
			monster4.makeGraphic(16, 16, 0xfff11111);
			monster4.maxVelocity.y = 0;
			monster4.acceleration.y = 0;
			monster4.immovable = true;
			this.add(monster4);
			
			monster5 = new FlxSprite(600, 365);
			monster5.makeGraphic(16, 16, 0xfff11111);
			monster5.maxVelocity.y = 0;
			monster5.acceleration.y = 0;
			monster5.immovable = true;
			this.add(monster5);
			
			monster6 = new FlxSprite(650, 365);
			monster6.makeGraphic(16, 16, 0xfff11111);
			monster6.maxVelocity.x = 0;
			monster6.acceleration.x = 0;
			monster6.immovable = true;
			this.add(monster6);
			
			
			
			this.monstertimer = new Timer(25);
			this.monstertimer.addEventListener(TimerEvent.TIMER, update_monsters);
			this.monstertimer.start();
			
			p1 = new SquarePlayer(50,50);
			add(p1);
			
			FlxG.camera.zoom = 2;
			FlxG.camera.follow(p1, 2);
		}
		
		private function update_monsters(e:TimerEvent):void {
			if (monster1_dir) {
				monster1.y += 4;
			}else {
				monster1.y -= 4;
			}
			if (monster1.y >= 384) {
				monster1_dir = false;
			}else if (monster1.y <= 320) {
				monster1_dir = true;
			}
			
			if (monster2_dir) {
				monster2.y += 4;
			}else {
				monster2.y -= 4;
			}
			if (monster2.y >= 384) {
				monster2_dir = false;
			}else if (monster2.y <= 320) {
				monster2_dir = true;
			}
			
			if (monster3_dir) {
				monster3.y += 4;
			}else {
				monster3.y -= 4;
			}
			if (monster3.y >= 384) {
				monster3_dir = false;
			}else if (monster3.y <= 320) {
				monster3_dir = true;
			}
			
			if (monster4_dir) {
				monster4.y += 4;
			}else {
				monster4.y -= 4;
			}
			if (monster4.y >= 384) {
				monster4_dir = false;
			}else if (monster4.y <= 320) {
				monster4_dir = true;
			}
			
			if (monster5_dir) {
				monster5.y += 4;
			}else {
				monster5.y -= 4;
			}
			if (monster5.y >= 384) {
				monster5_dir = false;
			}else if (monster5.y <= 320) {
				monster5_dir = true;
			}
			
			if (monster6_dir) {
				monster6.x += 4;
			}else {
				monster6.x -= 4;
			}
			if (monster6.x >= 925) {
				monster6_dir = false;
			}else if (monster6.x <= 650) {
				monster6_dir = true;
			}
		}
		
		override public function update():void
		{
			FlxG.collide(p1, _map);
			FlxG.collide(p1, platforme1);
			FlxG.collide(p1, platforme2);
			
			if (FlxG.collide(p1, deathLine)) {
				p1.respawn();
			}
			
			var mort1 :Boolean = FlxG.collide(p1, monster1);
			var mort2 :Boolean = FlxG.collide(p1, monster2);
			var mort3 :Boolean = FlxG.collide(p1, monster3);
			var mort4 :Boolean = FlxG.collide(p1, monster4);
			var mort5 :Boolean = FlxG.collide(p1, monster5);
			var mort6 :Boolean = FlxG.collide(p1, monster6);
			
			if (FlxG.collide(p1, door)) {
				FlxG.switchState(new PlayStateLvl5);
			}
			
			if (mort1 == true || mort2 == true || mort3 == true || mort4 == true || mort5 == true || mort6 == true) {
				p1.respawn();
			}
			
			super.update();
		}
	}
}

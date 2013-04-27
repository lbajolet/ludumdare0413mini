package com.ldd.uqam.minicontrapt
{
	import org.flixel.*;
 
	public class PlayState extends FlxState
	{
		public var p1:SquarePlayer;
		public var sol:FlxSprite;
		public var sol2:FlxSprite;
		public var dropSol:FlxSprite;
		public var dropSol2:FlxSprite;
		public var trigger:FlxSprite;
		public var auSol:Boolean = false;
		
		[Embed(source = '../../../../../Assets/TS.png')] private var ImgTiles:Class;
		[Embed(source = '../../../../../Assets/tm.txt', mimeType = "application/octet-stream")] private var DataMap:Class;
		private var _map:FlxTilemapExt;
		public static var lyrStage:FlxGroup;
		
		override public function create():void
		{	
			FlxG.worldBounds.width = 1500;
			FlxG.bgColor = 0xFFFFFFFF;
			_map = new FlxTilemapExt;
			_map.loadMap(new DataMap, ImgTiles, 16); 
			lyrStage = new FlxGroup;
			var tempFL:Array = new Array("4");
			var tempFR:Array = new Array("5");
			var tempCL:Array = new Array();
			var tempCR:Array = new Array();
			_map.setSlopes(tempFL, tempFR, tempCL, tempCR);
            lyrStage.add(_map);
			_map.immovable = true;
			this.add(lyrStage);
			
			p1 = new SquarePlayer(50,50);
			add(p1);
			/*sol = new FlxSprite(0, 200);
			sol.makeGraphic(100, 4, 0xffff8762);
			sol.maxVelocity.y = 0;
			sol.acceleration.y = 0;
			add(sol);
			
			*/sol2 = new FlxSprite(980, 380);
			sol2.makeGraphic(20, 4, 0xffff8762);
			sol2.maxVelocity.y = 0;
			sol2.acceleration.y = 0;
			
			dropSol = new FlxSprite(780, 340);
			dropSol.makeGraphic(20, 4, 0xffff8762);
			dropSol.maxVelocity.y = 0;
			dropSol.acceleration.y = 0;
			add(dropSol);
			
			dropSol2 = new FlxSprite(810, 300);
			dropSol2.makeGraphic(20, 4, 0xffff8762);
			dropSol2.maxVelocity.y = 0;
			dropSol2.acceleration.y = 0;
			add(dropSol2);
			
			trigger = new FlxSprite(1100, 300);
			trigger.makeGraphic(15, 15, 0xffff8762);
			trigger.acceleration.y = 0;
			trigger.maxVelocity.y = 0;
			add(trigger);
			
			FlxG.camera.follow(p1, 1);
		}
		
		override public function update():void
		{
			FlxG.collide(p1, _map);
			/*FlxG.collide(p1, sol);*/
			FlxG.collide(p1, sol2);
			var test:Boolean = FlxG.collide(p1, trigger);
			var test2:Boolean = FlxG.collide(p1, dropSol);
			var test3:Boolean = FlxG.collide(p1, dropSol2);
			if (test == true) {
				add(sol2);
			}
			
			if (test2 == true) {
				dropSol.maxVelocity.y = 80;
				dropSol.acceleration.y = 80;
			}
			
			if (test3 == true) {
				dropSol2.maxVelocity.y = 80;
				dropSol2.acceleration.y = 80;
			}
			super.update();
		}
	}
}
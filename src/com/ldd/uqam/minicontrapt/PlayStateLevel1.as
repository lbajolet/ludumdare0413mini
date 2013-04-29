package com.ldd.uqam.minicontrapt
{
	import mx.core.FlexApplicationBootstrap;
	import org.flixel.*;
	import org.flixel.plugin.*;
	import org.flixel.plugin.photonstorm.FlxCollision;
	/**
	 * ...
	 * @author 
	 */
	 
	
	
	public class PlayStateLevel1 extends FlxState
	{
		public var button:FlxButton;
		private var circle_player:TrianglePlayer;
		[Embed(source = '../../../../../Assets/chameauTroie.png')] private var cratePNG:Class;
		
		[Embed(source = '../../../../../Assets/Level1tileSet.png')] private var ImgTiles:Class;
		[Embed(source = '../../../../../Assets/Level1Map.txt', mimeType = "application/octet-stream")] private var DataMap:Class;
		private var _map:FlxTilemapExt;
		
		public static var lyrStage:FlxGroup;

		override public function create():void
		{
			FlxG.worldBounds.width = 3000;

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
			circle_player = new TrianglePlayer(0, 0);
			//crate = new Dromadaire(50,200, cratePNG);
			//crate.solid = crate.immovable = true;
			add(circle_player);
			/*var rect = new FlxRect(500, 0, 500, 10);
			var graph = new flixel*/
			FlxG.bgColor = 0xffffffff;
			//FlxG.camera.follow(crate);
			
			FlxG.camera.setBounds(0, 0, _map.width, _map.height, true);
			FlxG.camera.follow(circle_player, FlxCamera.STYLE_PLATFORMER);
			
		
		}
		
		override public function update():void
		{
			FlxG.collide(circle_player, _map);
			super.update();
		}
		
	}

}
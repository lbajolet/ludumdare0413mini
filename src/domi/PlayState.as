package domi
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source = '../Assets/tilemap.csv', mimeType = 'application/octet-stream')]public var levelMap:Class;
		[Embed(source = '../Assets/tilemap.png')]public var levelTiles:Class;
		
		public var map:FlxTilemap = new FlxTilemap;
		public var player:Player;
		public var triangle:Triangle;
		public var circle:Circle;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			add(map.loadMap(new levelMap, levelTiles, 16, 16));
			//add(player = new Player(10, 10));
			add(triangle = new Triangle(200, 10));
			//add(circle = new Circle(200, 10));
			
			super.create();
		}
		
		override public function update():void 
		{
			super.update();
			//FlxG.collide(player, map);
			FlxG.collide(triangle, map);
			//FlxG.collide(circle, map);
		}
	}
}
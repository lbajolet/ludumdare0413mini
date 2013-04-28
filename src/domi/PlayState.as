package domi
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source = '../Assets/tilemap.csv', mimeType = 'application/octet-stream')]public var levelMap:Class;
		[Embed(source = '../Assets/tilemap.png')]public var levelTiles:Class;
		
		public var map:FlxTilemap = new FlxTilemap;
		public var player:Player;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			add(map.loadMap(new levelMap, levelTiles, 16, 16));
			add(player = new Player(10, 10));
			super.create();
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.collide(player, map);
		}
	}
}
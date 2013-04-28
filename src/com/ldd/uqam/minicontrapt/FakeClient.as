package com.ldd.uqam.minicontrapt 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Squelos
	 */
	public class FakeClient extends Sprite
	{
		public function FakeClient() 
		{
			var module:NetworkModule  = new NetworkModule(new Client("127.0.0.1", 8080));
			module.SendMessage("Hello world\n");
			module.SendMessage("Hello world2\n");
			module.SendMessage("Hello world3\n");
			module.SendMessage("EXIT\n");
			
			
		}
	}
}
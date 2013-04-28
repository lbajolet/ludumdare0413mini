package com.ldd.uqam.minicontrapt 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Squelos
	 */
	public class FakeClient extends Sprite
	{
		public function FakeClient() 
		{
			var module:NetworkModule  = new NetworkModule(new Client("127.0.0.1", 8080));
			module.addEventListener(NetworkModule.MSG_RECV, onReceivedMessage);
			module.addEventListener(NetworkModule.NETWORK_ERROR, onNetworkError);
			
			
			module.SendMessage("Hello world1\n");
			module.SendMessage("Hello world\n");
			module.SendMessage("Hello world3\n");
			//module.SendMessage("EXIT\n");
			
			//module.addEventListener(NetworkModule.MSG_RECV, onReceivedMessage);
			//module.addEventListener(NetworkModule.NETWORK_ERROR, onNetworkError);
		}
		
		private function onReceivedMessage(e:CommunicationEvent):void
		{
				trace(e.Data);
		}
		
		private function onNetworkError(e:Event):void
		{
			
		}
	}
}
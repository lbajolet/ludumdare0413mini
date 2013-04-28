package com.ldd.uqam.minicontrapt 
{
	import flash.net.Socket;
	import flash.events.*;
	import flash.system.Security;
	/**
	 * The class to use when you want to communicate with the central
	 * server and the other players
	 * @author Squelos
	 */
	public class NetworkModule 
	{
		private var _socket:Socket;
		private var _opened:Boolean = false;
		
		//instanciates a NetworkModule and establishes the connection
		//with the specified peer client
		public function NetworkModule(client:Client) 
		{ 
			Security.allowDomain("*");
			Security.allowInsecureDomain("*");
			_socket = new Socket(client.getIp(), client.getPort());
			_socket.addEventListener(Event.CONNECT, onConnect);
			_socket.addEventListener(DataEvent.DATA, onData);
			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			_socket.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
		}
		
		/**
		* Sends a message on the current Socket if it is open. 
		* If it isnt opened, an exception is thrown
		* @throws Error when connection not opened
		*/
		public function SendMessage(message:String):void
		{
			//if (!_opened)
			//{
			//	throw new Error("Connection not opened");
			//}
			//else
			//{
				_socket.writeUTFBytes(message);
				trace("sent : " + message);
			//}
		}
		
		/**
		 * Closes the current connection
		 */
		public function CloseConnection():void
		{
			_socket.close();
			_opened = false;
		}
		
		/**
		 * 
		 * @return true if the sockets connection is established
		 */
		public function IsOpened():Boolean
		{
			return _opened;
		}
		
		private function onData(e:DataEvent):void
		{
			trace(e.data);
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void
		{
			trace(e.text);
			CloseConnection();
			trace("SecurityError Occured, Closing connection NOW !");
		}
	
		private function onConnect(e:Event):void
		{
			_opened = true;
			SendMessage("Connexion Ouverte et event leve");
			trace("Connected");
		}
		
		private function onIOError(e:IOErrorEvent)
		{
			CloseConnection();
			trace("IO Error Occured, Closing connection NOW !");
		}
	}
}
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
	public class NetworkModule extends EventDispatcher implements Subject
	{
		public static var MSG_RECV:String = "MessageReceived";
		public static var NETWORK_ERROR:String = "NetworkError";
		
		private var _socket:Socket;
		private var _opened:Boolean = false;
		private var _receivedQueue:Queue = new Queue();
		private var _observers:Array = new Array();
		
		
		//instanciates a NetworkModule and establishes the connection
		//with the specified peer client
		public function NetworkModule(client:Client) 
		{ 
			super();
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
				_socket.writeUTFBytes(message);
				trace("sent : " + message);
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
		 *  Returns the Message data on top of the queue without removing it
		 * @return The string data 
		 */
		public function PeekMessage():String
		{
			return _receivedQueue.spy();
		}
		
		/**
		 * Returns the first message in the queue and removes it
		 * @return The message on top of the queue
		 */
		public function GetMessage():String
		{
			return _receivedQueue.read();
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
			_receivedQueue.write(e.data);
			dispatchEvent(new CommunicationEvent(MSG_RECV, e.data, new Message(), false, false));
			trace(e.data);
		}
		
		private function onSecurityError(e:SecurityErrorEvent):void
		{
			trace(e.text);
			CloseConnection();
			trace("SecurityError Occured, Closing connection NOW !");
			dispatchEvent(new Event(NETWORK_ERROR, false, false));
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
			var stuff:Event = new Event("Stuff");
			
			dispatchEvent(new Event(NETWORK_ERROR, false, false));
		}
		
		/* INTERFACE com.ldd.uqam.minicontrapt.Subject */
		
		public function registerObserver(observer:Observer):void 
		{
			_observers.push(observer);
		}
		
		public function removeObserver(observer:Observer):void 
		{		
			_observers.splice(_observers.indexOf(observer, 0), 1);
		}
		
		public function notifyObservers():void 
		{
			(_observers[0] as Observer).update("Message Arrived");
		}
	}
}
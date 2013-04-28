package com.ldd.uqam.minicontrapt 
{
	/**
	 * ...
	 * @author Squelos
	 */
	public class Client 
	{
		private var _ip:String;
		private var _port:int;
		
		public function Client(ip:String, port:int) 
		{
			_ip = ip;
			_port = port;
		}
		
		public function getIp():String
		{
			return _ip;
		}
			
		public function getPort():int
		{
			return _port;
		}
	}
}
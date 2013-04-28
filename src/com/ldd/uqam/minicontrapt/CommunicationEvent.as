package com.ldd.uqam.minicontrapt 
{
	import flash.events.Event;
	
	/**
	 * An event used for communication purposes in the game
	 * it can contain the raw data and the message
	 * @author Squelos
	 */
	public class CommunicationEvent extends Event 
	{
		public var Data:String;
		public var Msg:Message;
		
		public function CommunicationEvent(type:String,dat:String, ms:Message, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			this.Msg = ms;
			this.Data = dat;
		} 
		
		public override function clone():Event 
		{ 
			return new CommunicationEvent(type,Data,Msg, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("CommunicationEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
	}
}
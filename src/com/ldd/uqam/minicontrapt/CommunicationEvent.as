package com.ldd.uqam.minicontrapt 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Squelos
	 */
	public class CommunicationEvent extends Event 
	{
		public var Data:String;
		public var Msg:Message;
		
		public function CommunicationEvent(type:String,data:String, msg:Message, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			this.Msg = msg;
			this.Data = data;
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
package com.ldd.uqam.minicontrapt 
{
	
	/**
	 * ...
	 * @author Squelos
	 */
	public interface Subject 
	{
		 function registerObserver(observer:Observer):void;

		 function removeObserver(observer:Observer):void;

		 function notifyObservers():void;
	}
	
}
package com.ldd.uqam.minicontrapt 
{
   /**
	 * ...
	 * @author Squelos
	 */
   public class Queue 
   {
      private var q:Array = [];
      public var l:int = 0;
      
      /**
       * CTOR
       */
      public function Queue() { }
      
      /**
       * Writes data to the end of the queue.
       * @param   d   Data to write, can be of any type.
       */
      public function write(d:*):void { q[q.length] = d; l++; }
      
      /**
       * Reads data from the beginning of the queue.
       * @return   Data stored at the beginning of the queue.
       */      
      public function read():* 
      {
        if (empty)
        {
          return  null;
        }
        else
        {
          l--;
          return q.shift(); 
        }
      }

      /**
       * Checks if the queue is empty and returns the result.
       */
      public function get empty():Boolean { return (l <= 0); }
      
      /**
       * Returns the data of the first queue element without removing it.
       * @return   Data of the first queue element.
       */
      public function spy():* {return (empty) ? null : q[0];}
   }
}
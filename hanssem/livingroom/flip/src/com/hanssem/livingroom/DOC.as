package com.hanssem.livingroom 
{
	import com.greensock.easing.*;
	import com.greensock.TweenMax;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author minwook - michinid@gmail.com
	 */
	public class DOC extends Sprite 
	{
		private var flipFlag:Boolean = false;
		
		public function DOC() 
		{
			stage.align = StageAlign.TOP;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			stage.addEventListener(Event.RESIZE, onResize);
			this.onResize(null);
			
			main.back.scaleX = -1;
			main.back.visible = false;
			
			main.addEventListener(MouseEvent.CLICK, onClick);
			
			addEventListener(Event.ENTER_FRAME, onEnter);
		}
		
		private function onClick(e:MouseEvent):void
		{
			flipFlag = !flipFlag;
			if (flipFlag)
			{
				TweenMax.to(main, 2.5, { rotationY:180, ease:Elastic.easeOut } );
			}
			else
			{
				TweenMax.to(main, 2.5, { rotationY:0, ease:Elastic.easeOut } );
			}
		}
		
		private function onEnter(e:Event):void 
		{
			if (main.rotationY > 90)
			{
				main.back.visible = true;
				main.bg.gotoAndStop(2);
			}
			else
			{
				main.back.visible = false;
				main.bg.gotoAndStop(1);
			}
		}
		
		private function onResize(e:Event):void 
		{
			var sw:Number = stage.stageWidth;
			main.msk.width = sw;
			gnb.bg.width = sw;
		}
		
	} 

}
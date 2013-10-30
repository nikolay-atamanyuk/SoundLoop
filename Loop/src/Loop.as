package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	/**
	 * This example is developed by Ezhi to story-play-game.com. If you
	 * have a questions, you can write me on e-mail: ezhi@story-play-game.com
	 */	
	public class Loop extends Sprite
	{
		[Embed(source="//..//assets//buzz_building_loop.mp3")]
		private var sampleSrc:Class 
		private var sampleSound:Sound;
		private var soundChannel:SoundChannel;
		private var startPadding:Number;
		private var endPadding:Number;
		private var loopPosition:Number;
		private var loopCount:uint;
		private var loopNum:uint;
		
		public function Loop():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			sampleSound = new sampleSrc() as Sound;
			
			startPadding=25;
			endPadding=230;
			loopPosition=sampleSound.length-endPadding;
			loopCount=10;
			loopNum=0;
			
			soundChannel = sampleSound.play(startPadding);
			
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			trace("sample sound length\t"+sampleSound.length);
			trace("loop position\t"+loopPosition);
		}
		
		private function onEnterFrame(e:Event):void
		{
			fakeMath();
			
			if(loopNum==loopCount)
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			else if(soundChannel.position>=loopPosition && loopNum<loopCount)
			{
				trace("loop: "+ loopNum+" position\t"+soundChannel.position);
				soundChannel.stop();
				soundChannel = sampleSound.play(startPadding);
				loopNum++;
			}
		}
		
		private function fakeMath():void
		{
			for(var i:uint=0; i<10000; i++)
				Math.sqrt(Math.pow(Math.sin(Math.random()), Math.cos(Math.random())));			
		}
		
	}
}
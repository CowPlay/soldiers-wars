package mailru
{
	import flash.events.Event;

	public class EventMailruCall extends Event
	{
		public var data:Object;
		public function EventMailruCall(type:String, data: Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.data = data;
			super(type, bubbles, cancelable);
		}
		
	}
}
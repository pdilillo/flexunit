package org.flexunit.internals.runners.statements.mock
{
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.internals.runners.statements.SequencerWithDecoration;
	import org.flexunit.runners.model.FrameworkMethod;
	import org.flexunit.token.mocks.AsyncTestTokenMock;
	
	public class TestableSequencerWithDecoration extends SequencerWithDecoration
	{
		public var evaluateWasCalled : Boolean = false;
		public var errorWhileEvaluating : Boolean = false;
		public var mockAsyncToken : AsyncTestTokenMock;
		
		protected var target:Object;
		
		public function TestableSequencerWithDecoration(afters:Array, target:Object, asyncTestToken : AsyncTestTokenMock)
		{
			super(afters, target);
			this.target = target;
			this.mockAsyncToken = asyncTestToken;
		}
		
		public function callExecuteStep( child : * ) : void
		{
			executeStep( child );
		}
		
		override protected function executeStep(child:*):void
		{
			var method:FrameworkMethod = child as FrameworkMethod;
			var statement:IAsyncStatement = withDecoration( method, this.target);
			
			try {
				evaluateWasCalled = true;
				statement.evaluate( this.mockAsyncToken );
			} catch ( error:Error ) {
				errors.push( error );
				errorWhileEvaluating = true;
			}
		}
	}
}
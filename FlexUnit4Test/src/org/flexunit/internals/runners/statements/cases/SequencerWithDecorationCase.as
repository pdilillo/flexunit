package org.flexunit.internals.runners.statements.cases
{
	import org.flexunit.Assert;
	import org.flexunit.internals.runners.statements.mock.AsyncStatementMock;
	import org.flexunit.internals.runners.statements.mock.TestableSequencerWithDecoration;
	import org.flexunit.token.mocks.AsyncTestTokenMock;

	public class SequencerWithDecorationCase
	{
		//TODO: This entire test case needs to be created.  Does the handleChildExecuteComplete method need to be called in order to
		//test the overridden function?  Since myToken is created, how do we test the catch part of the try catch statment of executeStep?
		
		protected var testAsyncSyncStatement : AsyncStatementMock;
		protected var testAsyncTestToken : AsyncTestTokenMock;
		protected var sequencerWithDecoration:TestableSequencerWithDecoration;
		protected var afters:Array;
		protected var target:Object;
		
		[Before(description="Create an instance of the SequncerWithDecoration class")]
		public function createSequencerWithDecoration():void {
			afters = new Array();
			target = new Object();
			testAsyncTestToken = new AsyncTestTokenMock();
			testAsyncSyncStatement = new AsyncStatementMock();
			sequencerWithDecoration = new TestableSequencerWithDecoration(afters, target, testAsyncTestToken);
		}
		
		[After(description="Remove the reference to the SequncerWithDecoration class")]
		public function destroySequencerWithDecoration():void {
			sequencerWithDecoration = null;
			testAsyncSyncStatement = null;
			target= null;
			afters = null;
		}
		
		[Test(description="Ensure that the executeStep function correctly works when no exception is thrown")]
		public function executeStepNoErrorTest():void {
			
			testAsyncTestToken.mock.method("sendResult").withAnyArgs.once;
			sequencerWithDecoration.callExecuteStep( testAsyncSyncStatement  );
			Assert.assertTrue( sequencerWithDecoration.evaluateWasCalled );
			Assert.assertFalse( sequencerWithDecoration.errorWhileEvaluating );
			testAsyncTestToken.mock.verify();
		}
		
		[Test(description="Ensure that the executeStep function correctly works when an exception is thrown")]
		public function executeStepErrorTest():void {
			sequencerWithDecoration.callExecuteStep( testAsyncSyncStatement );
			Assert.assertTrue( sequencerWithDecoration.evaluateWasCalled );
			Assert.assertTrue( sequencerWithDecoration.errorWhileEvaluating );
		}
	}
}
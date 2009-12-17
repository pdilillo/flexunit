package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	import org.flexunit.Assert;

	public class TestBeforeAfterAssertCase
	{	
		//Testing to be sure that if the setup fails the follow test isn't marked as failing twice for the Before and the Test.
		[Before]
		public function setUp():void
		{
			Assert.fail("this shouldn't break anything");
		}
		
		[Test]
		public function myEmptyTest() : void
		{
			Assert.assertTrue( false );
		}
		
	}
}
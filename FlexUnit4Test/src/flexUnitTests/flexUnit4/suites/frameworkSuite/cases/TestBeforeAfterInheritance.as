package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	import org.flexunit.Assert;

	public class TestBeforeAfterInheritance extends TestBeforeAfterInheritanceBaseClass
	{
		
		//Tests in this class plus the tests in the parent class will be run in the order given to them
		//If the order matches they'll be assigned a random order with that order group, 
		//unless OrderArgumentPlusAlphaSorter is used instead of the default Sorter
		[Before(order=1)]
		public function beginOne():void {
			orderBeforeCheckArray = new Array();
			orderBeforeCheckArray.push("beginChildOne");
		}
		
		[Before(order=3)]
		public function beginTwo():void {
			if( orderBeforeCheckArray.length == 2 )
				orderBeforeCheckArray.push("beginChildTwo");
			else
				Assert.fail("method ordering is incorrect");
		}
		
		[Before(order=5)]
		public function beginThree():void {
			if( orderBeforeCheckArray.length == 4 )
				orderBeforeCheckArray.push("beginChildThree");
			else
				Assert.fail("method ordering is incorrect");
		}
		
		[Test(order=1)]
		public function checkingBeforeOrder() : void {
			Assert.assertEquals( orderBeforeCheckArray.length, 6 );
		}
		
		[Test(order=2)]
		public function checkingAfterOrder() : void {
			//checking the results from the [After]s from the previous test
			Assert.assertEquals( orderAfterCheckArray.length, 6 );
		}

		[After(order=1)]
		public function afterOne():void {
			orderAfterCheckArray = new Array();
			orderAfterCheckArray.push("afterChildOne");
		}
		
		[After(order=3)]
		public function afterTwo():void {
			if( orderAfterCheckArray.length == 2 )
				orderAfterCheckArray.push("afterChildTwo");
			else
				Assert.fail("method ordering is incorrect");
		}

		[After(order=5)]
		public function afterThree():void {
			if( orderAfterCheckArray.length == 4 )
				orderAfterCheckArray.push("afterChildThree");
			else
				Assert.fail("method ordering is incorrect");
		}

	}
}
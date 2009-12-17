package flexUnitTests.flexUnit4.suites.frameworkSuite.cases
{
	import org.flexunit.Assert;
	import org.flexunit.asserts.fail;

	public class TestBeforeAfterInheritanceBaseClass extends TestBeforeAfterInheritanceBaseBaseClass
	{
		public static var orderBeforeCheckArray : Array;
		public static var orderAfterCheckArray : Array;
		
		[Before(order=2)]
		public function beginOneParent():void {
			if( orderBeforeCheckArray.length == 1 )
				orderBeforeCheckArray.push("beginParentOne");
			else
				Assert.fail("method ordering is incorrect");
		}
		
		[Before(order=4)]
		public function beginTwoParent():void {
			if( orderBeforeCheckArray.length == 3 )
				orderBeforeCheckArray.push("beginParentTwo");
			else
				Assert.fail("method ordering is incorrect");
		}
		
		[Before(order=6)]
		public function beginThreeParent():void {
			if( orderBeforeCheckArray.length == 5 )
				orderBeforeCheckArray.push("beginParentThree");
			else
				Assert.fail("method ordering is incorrect");
		}
		
		
		[After(order=2)]
		public function afterOneParent():void {
			if( orderAfterCheckArray.length == 1 )
				orderAfterCheckArray.push("afterParentOne");
			else
				Assert.fail("method ordering is incorrect");
		}
		
		[After(order=4)]
		public function afterTwoParent():void {
			if( orderAfterCheckArray.length == 3 )
				orderAfterCheckArray.push("afterParentTwo");
			else
				Assert.fail("method ordering is incorrect");
		}
		
		[After(order=6)]
		public function afterThreeParent():void {
			if( orderAfterCheckArray.length == 5 )
				orderAfterCheckArray.push("afterParentThree");
			else
				Assert.fail("method ordering is incorrect");
		}
	}
}
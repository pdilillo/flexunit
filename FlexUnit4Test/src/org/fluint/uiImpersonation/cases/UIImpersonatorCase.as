package org.fluint.uiImpersonation.cases
{
	import mx.containers.HBox;
	import mx.controls.TextInput;
	
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertTrue;
	import org.fluint.uiImpersonation.UIImpersonator;

	public class UIImpersonatorCase
	{
		//TODO: These tests and this test case need to be implemented
		[Before]
		public function setup() : void
		{
			
		}
		
		[After]
		public function teardown() : void
		{
			UIImpersonator.removeAllChildren();
		}
		
		[Test(ui, description="")]
		public function getNumChildrenTest():void {
			var testVisualObj : HBox = new HBox();
			var testVisualObj1 : HBox = new HBox();
			var testVisualObj2 : TextInput = new TextInput();
			
			UIImpersonator.addChild( testVisualObj );
			UIImpersonator.addChild( testVisualObj1 );
			UIImpersonator.addChild( testVisualObj2);
			
			Assert.assertTrue( UIImpersonator.numChildren == 3  );
		}
		
		[Test(ui,description="Ensure adding a child to the UIImpersonator and making sure we get it back.")]
		public function addChildTest():void {
			var testVisualObj : HBox = new HBox();
			Assert.assertTrue( UIImpersonator.addChild( testVisualObj ) is HBox );
			Assert.assertTrue( UIImpersonator.numChildren == 1  );
		}
		
		[Test(ui,description="Ensure adding a child to a specific index of the UIImpersonator returns that object to you with no errors.")]
		public function addChildAtTest():void {
			var testVisualObj : HBox = new HBox();
			var testVisualObj1 : HBox = new HBox();
			var testVisualObj2 : TextInput = new TextInput();
			
			UIImpersonator.addChild( testVisualObj );
			UIImpersonator.addChild( testVisualObj1 ); 
			
			
			Assert.assertTrue( UIImpersonator.addChildAt( testVisualObj2, 0 ) is TextInput );
				Assert.assertTrue( UIImpersonator.numChildren == 3  );
		}
		
		[Test(ui,description="Ensure removing a child from the UIImpersonator actually works.")]
		public function removeChildTest():void {
			var testVisualObj : HBox = new HBox();
			var testVisualObj1 : HBox = new HBox();
			
			UIImpersonator.addChild( testVisualObj );
			UIImpersonator.addChild( testVisualObj1 );
			
			Assert.assertTrue( UIImpersonator.removeChildAt( 0 ) is HBox );
					
			Assert.assertTrue( UIImpersonator.numChildren == 1  );
		}
		
		[Test(ui,description="Ensure removing a child from a specific index of the UIImpersonator works and removes the child you expect.")]
		public function removeChildAtTest():void {
			var testVisualObj : HBox = new HBox();
			var testVisualObj1 : TextInput = new TextInput();
			
			UIImpersonator.addChild( testVisualObj );
			UIImpersonator.addChild( testVisualObj1 );
				
			Assert.assertTrue( UIImpersonator.removeChildAt( 1 ) is TextInput );
				
			Assert.assertTrue( UIImpersonator.numChildren == 1  );
		}
		
		[Test(ui,description="Ensure removing all children actually removes them and the number of children is zero.")]
		public function removeAllChildrenTest():void {
			var testVisualObj : HBox = new HBox();
			var testVisualObj1 : TextInput = new TextInput();
			
			UIImpersonator.addChild( testVisualObj );
			UIImpersonator.addChild( testVisualObj1 );
					
			UIImpersonator.removeAllChildren();
			Assert.assertTrue( UIImpersonator.numChildren == 0  );
		}
		
		[Test(ui,description="Ensure getting a child at a specific index in the UIImpersonator returns the child you would expect.")]
		public function getChildAtTest():void {
			var testVisualObj : HBox = new HBox();
			var testVisualObj1 : TextInput = new TextInput();
			
			UIImpersonator.addChild(testVisualObj );
			UIImpersonator.addChild( testVisualObj1 );
					
			Assert.assertTrue( UIImpersonator.getChildAt(0) is HBox  );
		}
		
		[Test(ui,description="Ensure getting a child by it's name in the UIImpersonator returns the child you would expect.")]
		public function getChildByNameTest():void {
			var testVisualObj : HBox = new HBox();
			var testVisualObj1 : HBox = new HBox();
			testVisualObj1.name = "myHBox";
			var testVisualObj2 : TextInput = new TextInput();
			testVisualObj2.name = "myTextInput";
			
			UIImpersonator.addChild( testVisualObj );
			UIImpersonator.addChild( testVisualObj1 );
			UIImpersonator.addChild( testVisualObj2 );
				
			Assert.assertTrue( UIImpersonator.getChildByName( "myTextInput" ) is TextInput );
		}
		
		[Test(ui,description="Ensure getting the child Index on the UIImpersonator returns the child Index you would expect.")]
		public function getChildIndexTest():void {
			var testVisualObj : HBox = new HBox();
			var testVisualObj1 : HBox = new HBox();
			testVisualObj1.name = "myHBox";
			var testVisualObj2 : TextInput = new TextInput();
			testVisualObj2.name = "myTextInput";
			
			UIImpersonator.addChild( testVisualObj );
			UIImpersonator.addChild( testVisualObj1 );
			UIImpersonator.addChild( testVisualObj2 );
			
			Assert.assertTrue( UIImpersonator.getChildIndex( testVisualObj1 ) == 1 );
		}
		
		[Test(ui,description="Ensure setting the child Index on the UIImpersonator moves the child to the index specified.")]
		public function setChildIndexTest():void {
			var testVisualObj : HBox = new HBox();
			var testVisualObj1 : HBox = new HBox();
			testVisualObj1.name = "myHBox";
			var testVisualObj2 : TextInput = new TextInput();
			testVisualObj2.name = "myTextInput";
			
			UIImpersonator.addChild( testVisualObj );
			UIImpersonator.addChild( testVisualObj1 );
			UIImpersonator.addChild( testVisualObj2 );
			
			UIImpersonator.setChildIndex( testVisualObj2, 0 );
			Assert.assertTrue( UIImpersonator.getChildIndex( testVisualObj2 ) == 0 );
		}
		
	}
}
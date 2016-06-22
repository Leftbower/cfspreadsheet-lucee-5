<cfcomponent  extends="testbox.system.compat.framework.TestCase">

	<cffunction name="testDefaultSheetName" access="public" returnType="void">
		<cfset Local.sheet = SpreadsheetNew()>
		<cfset Local.sheetName = Local.sheet.getActiveSheet().getSheetName() />
		<cfset assertEquals( this.defaultSheetName, Local.sheetName) />
	</cffunction>		
	
	<!--- Test Issue #6  - SpreadsheetNew() sheetName Argument Does Nothing --->
	<cffunction name="testUserSuppliedSheetName" access="public" returnType="void">
		<cfset Local.expectedName 	= "The Foo.bar.baz - sheet $ name" />
		<cfset Local.sheet = SpreadsheetNew( Local.expectedName ) />
		<cfset Local.actualName = Local.sheet.getActiveSheet().getSheetName() />
		<cfset assertEquals( Local.expectedName, Local.actualName, "Sheet names are not supported yet") />
	</cffunction>		

	<cffunction name="testXMLFormat" access="public" returnType="void">
		<cfset Local.sheetName = "My Sheet Name">

		<!--- confirm default format is binary format --->
		<cfset Local.sheet = SpreadsheetNew()>
		<cfset assertTrue( Local.sheet.isBinaryFormat(), "Default format should be binary") />
		
		<cfset Local.sheet 	= SpreadsheetNew( Local.sheetName ) />
		<cfset assertTrue( Local.sheet.isBinaryFormat(), "Default format should be binary") />
		
		<cfset Local.sheet 	= SpreadsheetNew(Local.sheetName, false) />
		<cfset assertTrue( Local.sheet.isBinaryFormat(), "Binary format not detected") />

		<cfset Local.sheet 	= SpreadsheetNew(Local.sheetName, true ) />
		<cfset assertFalse( Local.sheet.isBinaryFormat(), "Xml format not detected") />

		<cfset Local.wb  = Local.sheet.getWorkBook()>
		<cfset Local.className = Local.wb.getClass().getName()>
		<cfset assertEquals( Local.className, "org.apache.poi.xssf.usermodel.XSSFWorkbook") />
	</cffunction>		
	
	<cffunction name="setUp" returntype="void" access="public">
		<cfset this.defaultSheetName = "Sheet1" />
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
	</cffunction>

</cfcomponent>
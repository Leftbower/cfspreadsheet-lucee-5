<cfcomponent extends="testbox.system.compat.framework.TestCase">
	
	<cffunction name="testSetHeaderLeftOnly" access="public" returnType="void">
		<cfset Local.sheet = SpreadsheetNew()>
		<cfset Local.text = " this is left!" />
		<cfset SpreadSheetSetCellValue(Local.sheet, "some text", 1, 1) />
		<cfset SpreadSheetSetHeader(Local.sheet, Local.text, "", "") />
		
		<cfset Local.header = Local.sheet.getActiveSheet().getHeader() />
		<cfset assertEquals( Local.text, Local.header.getLeft() ) />
	</cffunction>		

	<cffunction name="testSetHeaderCenterOnly" access="public" returnType="void">
		<cfset Local.sheet = SpreadsheetNew()>
		<cfset Local.text =" this is center!" />
		<cfset SpreadSheetSetHeader(Local.sheet, "", Local.text, "") />
		
		<cfset Local.header = Local.sheet.getActiveSheet().getHeader() />
		<cfset assertEquals( Local.text, Local.header.getCenter() ) />
	</cffunction>		

	<cffunction name="testSetHeaderRightOnly" access="public" returnType="void">
		<cfset Local.sheet = SpreadsheetNew()>
		<cfset Local.text =" this is right!" />
		<cfset SpreadSheetSetHeader(Local.sheet, "", "", Local.text) />
		
		<cfset Local.header = Local.sheet.getActiveSheet().getHeader() />
		<cfset assertEquals( Local.text, Local.header.getRight() ) />
	</cffunction>		

	<cffunction name="testSetHeaderAllThree" access="public" returnType="void">
		<cfset Local.sheet = SpreadsheetNew()>
		<cfset SpreadSheetSetHeader(Local.sheet, "left", "center", "right") />
		<cfset Local.header = Local.sheet.getActiveSheet().getHeader() />

		<cfset assertEquals( "left", Local.header.getLeft(), "left header") />
		<cfset assertEquals( "center", Local.header.getCenter(), "center header") />
		<cfset assertEquals( "right", Local.header.getRight(), "right header") />
	</cffunction>		

		
	<cffunction name="setUp" returntype="void" access="public">
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
		<!--- Any code needed to return your environment to normal goes here --->
	</cffunction>

</cfcomponent>


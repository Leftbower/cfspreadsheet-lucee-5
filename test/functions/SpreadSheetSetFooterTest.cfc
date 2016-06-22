<cfcomponent extends="testbox.system.compat.framework.TestCase">
	
	<cffunction name="testSetFooterLeftOnly" access="public" returnType="void">
		<cfset Local.sheet = SpreadsheetNew()>
		<cfset Local.text = " this is left!" />
		<cfset SpreadSheetSetCellValue(Local.sheet, "some text", 1, 1) />
		<cfset SpreadSheetSetFooter(Local.sheet, Local.text, "", "") />
		
		<cfset Local.footer = Local.sheet.getActiveSheet().getFooter() />
		<cfset assertEquals( Local.text, Local.footer.getLeft() ) />
	</cffunction>		

	<cffunction name="testSetFooterCenterOnly" access="public" returnType="void">
		<cfset Local.sheet = SpreadsheetNew()>
		<cfset Local.text =" this is center!" />
		<cfset SpreadSheetSetFooter(Local.sheet, "", Local.text, "") />
		
		<cfset Local.footer = Local.sheet.getActiveSheet().getFooter() />
		<cfset assertEquals( Local.text, Local.footer.getCenter() ) />
	</cffunction>		

	<cffunction name="testSetFooterRightOnly" access="public" returnType="void">
		<cfset Local.sheet = SpreadsheetNew()>
		<cfset Local.text =" this is right!" />
		<cfset SpreadSheetSetFooter(Local.sheet, "", "", Local.text) />
		
		<cfset Local.footer = Local.sheet.getActiveSheet().getFooter() />
		<cfset assertEquals( Local.text, Local.footer.getRight() ) />
	</cffunction>		

	<cffunction name="testSetFooterAllThree" access="public" returnType="void">
		<cfset Local.sheet = SpreadsheetNew()>
		<cfset SpreadSheetSetFooter(Local.sheet, "left", "center", "right") />
		<cfset Local.footer = Local.sheet.getActiveSheet().getFooter() />

		<cfset assertEquals( "left", Local.footer.getLeft(), "left footer") />
		<cfset assertEquals( "center", Local.footer.getCenter(), "center footer") />
		<cfset assertEquals( "right", Local.footer.getRight(), "right footer") />
	</cffunction>		

		
	<cffunction name="setUp" returntype="void" access="public">
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
		<!--- Any code needed to return your environment to normal goes here --->
	</cffunction>

</cfcomponent>


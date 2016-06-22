<cfcomponent extends="testbox.system.compat.framework.TestCase">
	
	<cffunction name="testInfoOnNewSheet" access="public" returnType="void">
		<!--- Simple test of Issue #5 Calling SpreadSheetInfo on "New" sheet causes error --->
		<cfset Local.sheet = SpreadsheetNew()>
		<cfset Local.info = SpreadSheetInfo( Local.sheet ) />
		
		<cfset assertEquals( Local.info.sheets, 1 ) />
	</cffunction>		

	<cffunction name="testInfoOnSavedSheet" access="public" returnType="void">
	
		<cfset Local.sheet = SpreadsheetNew()>
		<cfset SpreadSheetCreateSheet( Local.sheet, "My New Sheet") />
		<cfset SpreadSheetWrite( Local.sheet, this.savedSheet, true ) />
		
		<cfset Local.sheet = SpreadsheetRead( this.savedSheet ) />
		<cfset Local.info = SpreadSheetInfo( Local.sheet ) />
		<cfset assertEquals( Local.info.sheets, 2, "Wrong number of sheets") />
	</cffunction>		

	<cffunction name="setUp" returntype="void" access="public">
		<cfset this.savedSheet = ExpandPath("./SpreadSheetInfoTest.xls") />
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
		<!--- Any code needed to return your environment to normal goes here --->
		<cfif fileExists(this.savedSheet)>
			<cfset FileDelete( this.savedSheet) />
		</cfif>
	</cffunction>

</cfcomponent>


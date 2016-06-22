<cfcomponent  extends="testbox.system.compat.framework.TestCase">

	<!--- Begin specific tests --->
	<cffunction name="testNoArgumentsShouldFail" access="public" returnType="void">
		<cftry>
			<cfset Local.sheet = SpreadsheetRead() />
			<cfset fail("At least one argument is required") />
			<cfcatch>
				<!--- success. an error should be thrown. success --->
			</cfcatch>
		</cftry>
	</cffunction>		

	<cffunction name="testReadBinaryFormat" access="public" returnType="void">

		<cfset Local.sheetName = "My Binary Sheet" />
		<cfset Local.sheet = SpreadSheetNew( Local.sheetName ) />
		<cfset SpreadSheetWrite( Local.sheet, this.binaryFilePath, true) />
		<cfset Local.sheet = SpreadsheetRead( this.binaryFilePath ) />

		<cfset Local.info  = SpreadSheetInfo( Local.sheet ) />
		<cfset assertEquals( Local.sheetName, Local.info.sheetNames )>

	</cffunction>		

	<cffunction name="testReadXMLFormat" access="public" returnType="void">

		<cfset Local.sheetName = "My XML Sheet" />
		<cfset Local.sheet = SpreadSheetNew( Local.sheetName, true ) />
		<cfset SpreadSheetWrite( Local.sheet, this.xmlFilePath, true) />
		<cfset Local.sheet = SpreadsheetRead( this.xmlFilePath ) />
		
		<!--- We do not support SpreadSheetInfo for XLSX files yet. 
			So let us just verify it is a spreadsheet object --->  
		<cfset assertTrue( IsSpreadSheetObject( Local.sheet ) )>
	</cffunction>		

	<cffunction name="setUp" returntype="void" access="public">
		<cfset this.binaryFilePath = ExpandPath("./spreadSheetReadTest_binary.xls") />
		<cfset this.xmlFilePath = ExpandPath("./spreadSheetReadTest_xml.xlsx") />
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
		<cfif FileExists( this.binaryFilePath )>
			<cfset FileDelete( this.binaryFilePath )>
		</cfif>
		<cfif FileExists( this.xmlFilePath )>
			<cfset FileDelete( this.xmlFilePath )>
		</cfif>
	</cffunction>

</cfcomponent>


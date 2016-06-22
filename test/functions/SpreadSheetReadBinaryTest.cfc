<cfcomponent  extends="testbox.system.compat.framework.TestCase">

	<cffunction name="testBinaryFormat" access="public" returnType="void">
		
		<cfset Local.data  = "foo,bar,baz" />
		<cfset Local.sheet = SpreadSheetNew() />
		<cfset SpreadSheetAddColumn( Local.sheet, Local.data ) />
		<cfset Local.bytes = SpreadSheetReadBinary( Local.sheet ) />

		<!--- save the sheet and read it back in --->
		<cfset FileWrite(this.binaryFilePath, Local.bytes, true) />
		<cfset Local.sheet = SpreadSheetRead( this.binaryFilePath ) />
		
		<!--- verify it was not corrupted --->
		<cfset checkRowValues( Local.sheet, Local.data ) />
	</cffunction>		

	<cffunction name="testXMLFormat" access="public" returnType="void">
		
		<cfset Local.data  = "foo,bar,baz" />
		<cfset Local.sheet = SpreadSheetNew("My Sheet", true) />
		<cfset SpreadSheetAddColumn( Local.sheet, Local.data ) />
		<cfset Local.bytes = SpreadSheetReadBinary( Local.sheet ) />

		<!--- save the bytes and read the sheet back in --->
		<cfset FileWrite(this.xmlFilePath, Local.bytes, true) />
		<cfset Local.sheet = SpreadSheetRead( this.xmlFilePath ) />
		
		<!--- verify it was not corrupted --->
		<cfset checkRowValues( Local.sheet, Local.data ) />
	</cffunction>		


	<!--- Issue #10 SpreadsheetReadBinary does not return binary --->
	<cffunction name="testReadBinaryDoesNotReturnArray" access="public" returnType="void">
		<!--- Not comparing SpreadSheetReadBinary and FileReadBinary results, because the 
		    array sizes are sometimes different under BOTH Railo and ACF. Not sure why yet ..--->
		<cfset Local.sheet = SpreadSheetNew() />
		<cfset Local.bytes = SpreadSheetReadBinary( Local.sheet ) />

		<!--- lame test to ensure result is binary --->
		<cfset assertTrue( IsBinary( Local.bytes ), "Byte array cannot be empty" ) />
	</cffunction>
	
	<cffunction name="checkRowValues" access="private" returnType="void">
		<cfargument name="sheet" 	type="any" />
		<cfargument name="data" 	type="string" hint="List of expected data values"/>
		<cfargument name="startRow" type="numeric" default="1" />
		<cfargument name="startCol" type="numeric" default="1" />
		<cfargument name="delim" 	type="string" default="," hint="data delimiter" />

		<cfset Local.rowOffset = arguments.startRow - 1 />
		<cfset Local.endRow = arguments.startRow + listLen(arguments.data, arguments.delim) - 1 />
		<cfloop from="#arguments.startRow#" to="#Local.endRow#" index="Local.row">
			<cfset Local.expected = listGetAt( arguments.data, (Local.row-Local.rowOffset), arguments.delim ) />
			<cfset Local.actual   = SpreadSheetGetCellValue(arguments.sheet, Local.row, arguments.startCol) />
			<cfset assertEquals( Local.expected, Local.actual, "#arguments.data#:: row=#Local.row# / col=#arguments.startCol#") />			
		</cfloop>
	</cffunction>
		
	<cffunction name="setUp" returntype="void" access="public">
		<cfset this.binaryFilePath = ExpandPath("./spreadSheetReadBinary_binary.xls") />
		<cfset this.xmlFilePath = ExpandPath("./spreadSheetReadBinary_xml.xlsx") />
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


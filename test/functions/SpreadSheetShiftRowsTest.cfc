<cfcomponent extends="testbox.system.compat.framework.TestCase">
	
	
	<cffunction name="testShiftSingleRow" access="public" returnType="void">
		<cfset Local.sheet 	   = SpreadsheetNew()>

		<!--- create sample rows --->
		<cfset Local.startRow  = 3 />
		<cfset Local.endRow    = 8 />
		<cfset Local.startCol  = 1 />
		<cfset Local.data      = "a,b,c" />
		
		<cfloop from="#Local.startRow#" to="#Local.endRow#" index="Local.row">
			<cfset SpreadSheetAddRow(Local.sheet, Local.data, Local.row, Local.startCol ) />
		</cfloop>

		<!--- shift one row --->
		<cfset Local.shiftRow = 6 />
		<cfset SpreadsheetShiftRows(Local.sheet, Local.shiftRow)>
		
		<!--- verify old row is now empty --->
		<cfset Local.testRow = Local.sheet.getActiveSheet().getRow( javacast("int", Local.shiftRow - 1) ) />
		<cfset assertEquals( 0, Local.testRow.getPhysicalNumberOfCells(), "cells in row [#Local.shiftRow#]") />

		<!--- verify the next row contains our shifted value --->
		<cfset Local.shiftedValue = SpreadSheetGetCellValue(Local.sheet, Local.shiftRow+1, Local.startCol )  />
		<cfset assertEquals( listGetAt(Local.data, Local.startCol), Local.shiftedValue, "target row ["& Local.shiftRow+1 &"]") />

	</cffunction>		

	<cffunction name="testShiftRangeOfRows" access="public" returnType="void">

		<cfset Local.sheet 		= SpreadsheetNew()>

		<!--- create sample rows --->
		<cfset Local.startRow  	= 3 />
		<cfset Local.endRow 	= 12 />
		<cfset Local.startCol   = 1 />
		
		<cfloop from="#Local.startRow#" to="#Local.endRow#" index="Local.row">
			<cfset SpreadSheetAddRow( Local.sheet, "row_"& Local.row, Local.row, Local.startCol ) />
		</cfloop>

		<!--- shift a range of rows --->
		<cfset Local.startShiftRow = 6 />
		<cfset Local.endShiftRow   = 8 />
		<cfset Local.rowsToShift   = 9 />
		<cfset SpreadsheetShiftRows( Local.sheet, Local.startShiftRow, Local.endShiftRow, Local.rowsToShift) />
		
		<!--- original rows should now be empty --->
		<cfloop from="#Local.startShiftRow#" to="#Local.endShiftRow#" index="Local.row">
			<cfset Local.testRow = Local.sheet.getActiveSheet().getRow( javacast("int", Local.row - 1) ) />
			<cfset assertEquals( 0 , Local.testRow.getPhysicalNumberOfCells(), "row [#Local.row#] cells" ) />
		</cfloop>

		<!--- verify values were shifted as expected --->
		<cfloop from="#Local.startShiftRow#" to="#Local.endShiftRow#" index="Local.row">
			<cfset Local.targetRow = Local.row + Local.rowsToShift />
			<cfset Local.actual = SpreadSheetGetCellValue(Local.sheet, Local.targetRow, Local.startCol )  />
			<cfset assertEquals( "row_"& Local.row , Local.actual, "row [#Local.targetRow#]" ) />
		</cfloop>

	</cffunction>		
		
	<cffunction name="setUp" returntype="void" access="public">
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
	</cffunction>

</cfcomponent>


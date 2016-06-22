
<cfscript>
	excludes  = ".svn,.";
	currDir   = getDirectoryFromPath(getCurrentTemplatePath());
	files 	  = DirectoryList(currDir, false, "name", "*.cfc");
 	testSuite = createObject("component","testbox.system.compat.framework.TestSuite").TestSuite();

	for (Local.row = 1; Local.row <= arrayLen(files); Local.row++) {
		name = listFirst( files[ Local.row ], "." );
		if (not listfindNoCase(excludes, name)) {
		 	testSuite.addAll( "test.functions."& name );
		}
	}	

 	results = testSuite.run();
 	WriteOutput(results.getResultsOutput());
</cfscript>

# \<cfspreadsheet /> for Lucee 5.x

###Link to cfspreadsheet for Lucee 4.x:
[https://github.com/Leftbower/cfspreadsheet-lucee](https://github.com/Leftbower/cfspreadsheet-lucee "cfspreadsheet-lucee 4.x")

##Install:
1. Download and drop the `cfspreadsheet-lucee-5.lex` into the `lucee-server\deploy` directory.
1. Add a mapping as follows: Lucee Server Admin > Archives & Resources > Components: Go to "Create new Additional Resource" and add a name and under resource put "{lucee-server}/components/". Save with default settings.

##Notes:
1. Uninstall does not currently remove files installed into components directory in lucee-server.
1. Currently only working as a server extension until LDEV-797 is fixed (installing to `components` directory not supported yet in Lucee web context).
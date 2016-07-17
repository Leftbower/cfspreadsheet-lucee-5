# \<cfspreadsheet /> for Lucee 5.x

###Link to cfspreadsheet for Lucee 4.x:
[https://github.com/Leftbower/cfspreadsheet-lucee](https://github.com/Leftbower/cfspreadsheet-lucee "cfspreadsheet-lucee 4.x")

##Install:
1. Download and copy the `cfspreadsheet-lucee-5.lex` into the `/lucee-server/deploy` or `{lucee-web}/deploy` directory of a running Lucee 5 installation.
1. Wait a little bit, it can take Lucee up to a minute to recognize and install the extension. After the extension disappears from the `deploy` directory it is installed. If you now go to the Lucee Server or Web Admin and to the "Extension/Application" section, you should see it there as installed.

##Notes:
1. Works for both the server or an individual web context.
1. Uninstall does not currently remove the .lar file installed into archives directory.
1. Installing into the web-context components directory currently not supported in Lucee 5, so the component cfc is bundled into a .lar with component mapping.
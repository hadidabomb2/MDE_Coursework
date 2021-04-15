# AWK DSML
## OVERVIEW
A model for the AWK programming language. AWK is commonly paired with GAWK, which is the GNU implementation of the AWK programming language and is a standard system admin tool available in most Linux distributions. AWK is a very powerful language containing a number of constructs that give users fine-grained control when it comes to the language’s primary purpose: how data from a file system can be handled, manipulated and formatted. It is specialised to deal with text files organised in columns and provides various tools ranging from pattern matching to report generation. 
## SETUP
* Git clone or download zip and extract files.
* Import all projects into Eclipse except for the 'uk.ac.kcl.mde.awk.xpect' project.
* Right-click on the Awk.xtext in the main 'uk.ac.kcl.mde.awk' project located in the src folder. Hover over 'Run As' option and click on 'Generate Xtext Artifacts'.
* Create empty source files where needed, errors will be thrown to show the user where. This step should not be needed as empty placeholders have been already set to make intialisation easier. However, Eclipse can be configured in different ways so a caution is given here.
* Right-click on the main 'uk.ac.kcl.mde.awk' project. Hover over 'Run As' option and click on 'Eclipse Application'.
* Import the 'uk.ac.kcl.mde.awk.xpect' project in the application that opens.
* Test and learn using the xpect project or create your own .awk files!
  * To run the tests: right-click on the main 'uk.ac.kcl.mde.awk.xpect' package located in the src folder of the 'uk.ac.kcl.mde.awk.xpect' project. Hover over 'Run As' and click on 'JUnit Test'.
  * A test.awk file is already located in the 'uk.ac.kcl.mde.awk.xpect' project located in the src folder. This contains an example project that the user can interact with.

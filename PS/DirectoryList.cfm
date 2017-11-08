<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>


<cfscript> 



filteredResults = directorylist(expandPath("C:\Users\vkoloyu\eclipse\ColdFusion\ColdFusion\cfusion\wwwroot\Testing\"), true, "path");
writeDump(filteredResults);
</cfscript>

<cfset res= DirectoryList('C:\Users\vkoloyu\eclipse\ColdFusion\ColdFusion\cfusion\wwwroot\Testing\')> 


<cfloop array="#res#" item="itm">
<cfoutput>
#itm#
 </cfoutput>
</cfloop>
</body>
</html>

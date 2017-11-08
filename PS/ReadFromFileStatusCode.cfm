<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>
<cfsetting requestTimeOut = "9000" />
 <cfoutput> This TEST is sending request to 2700+ ps.com Vanity URLs.. Results will display here after 10 min of runnung ...</cfoutput>
<!---LOOP https://helpx.adobe.com/coldfusion/cfml-reference/coldfusion-tags/tags-j-l/cfloop-looping-over-a-list-a-file-or-an-array.html --->




<cfset myFile="c:\tmp\vurl.txt"/>
<cfloop file="#myFile#" index="i" item="line">
    <cftry> 
             <cfhttp url="#line#" result="result" method="GET"> </cfhttp> 	
		     <cfoutput > #line# > #result.Responseheader.Status_Code#</cfoutput>
		     <cfoutput ><br></cfoutput>
       <cfcatch type = "Any"> </cfcatch>
    </cftry> 
</cfloop>











</body>
</html>

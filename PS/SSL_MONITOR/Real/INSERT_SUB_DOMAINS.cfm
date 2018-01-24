<!---Form processing Script --->
<cfif structKeyExists(form, 'SubmitLSDOMAINS')>
	<!--- Start server side data validation --->
	<cfset aErrorMessages = ArrayNew(1) />
	
		<!--- validate ID --->
		<cfif form.id EQ ''>
			<cfset arrayAppend(aErrorMessages, 'Please provide a valid ID') />
		</cfif>
		<!--- validate DomainID --->
		<cfif form.domain_id EQ ''>
			<cfset arrayAppend(aErrorMessages, 'Please provide a valid DomainID') />
		</cfif>
			<!--- validate DomainID --->
		<cfif form.sub_domain EQ ''>
			<cfset arrayAppend(aErrorMessages, 'Please provide a valid subDomain') />
		</cfif>
		
		<!--- Lets check if aErrorMessages empty? --->
		<cfif ArrayIsEmpty(aErrorMessages)>
			<!---goon on form process coz no error --->
			
			<!---EXAMPLE INSERT INTO "SYSTEM"."LS_CERTIFICATES" (ID, DOMAIN_ID, SUB_DOMAIN_ID, DATE_EXPIRES) VALUES ('2', '1', '2', TO_TIMESTAMP('2018-01-29 17:49:07.766000000', 'YYYY-MM-DD HH24:MI:SS.FF'))
 --->
			
			<cfquery datasource="ORACLE_DEV">
				INSERT INTO LS_SUB_DOMAINS 
				(ID, DOMAIN_ID, SUB_DOMAIN)
				VALUES 
				(
			<cfqueryparam value="#form.id#" cfsqltype="CF_SQL_NUMERIC">,
			<cfqueryparam value="#form.domain_id#" cfsqltype="CF_SQL_NUMERIC">,
			<cfqueryparam value="#form.sub_domain#" cfsqltype="CF_SQL_VARCHAR">
				)
			</cfquery>
			
			<!---feedback --->
			<cfset domainisinserted = true>
		</cfif>
</cfif>


<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}

</style>
</head>

<body>
	<!--- server side data validation error messages goes here if any --->
<cfif isDefined('aErrorMessages')  >
	<cfoutput >
	<cfloop array="#aErrorMessages#" index="message">
		<p>
			#message#
		</p>
	</cfloop>
	</cfoutput>
</cfif>

<cfif isDefined('domainisinserted')>
<cfset structClear(form)>
<cfset domainisinserted = false>
<cflocation url="INSERT_SUB_DOMAINS.cfm">
</cfif>

<cfform id="insertLSSUBDOMAINS" name= "insertLSSUBDOMAINS" method="post" >
<fieldset style="display: inline-block">	 <legend>INSERT data to LS_SUB_DOMAINS table</legend>
<table style="width:auto">

  <tr>
    <th>Fields</th>
    <th>Data</th> 
  
  </tr>
  <tr>
    <td>ID:</td>
    <td><cfinput type="text" name="id"  required ></td>
   
  </tr>
  <tr>
    <td>Domain ID:</td>
    <td><cfinput type="text" name="domain_id"  required /> </td>
  
  </tr>
  <tr>
    <td>Sub Domain:</td>
    <td> <cfinput type="text" name="sub_domain"  required  /></td>
 
  </tr>

</table>


  <cfinput type="submit" name="SubmitLSDOMAINS" value="Submit">
   </fieldset>
</cfform> 

</body>
</html>
<!---Form processing Script --->
<cfif structKeyExists(form, 'SubmitLSDOMAINS')>
	<!--- Start server side data validation --->
	<cfset aErrorMessages = ArrayNew(1) />
	
		<!--- validate ID --->
		<cfif form.id EQ ''>
			<cfset arrayAppend(aErrorMessages, 'Please provide a valid ID') />
		</cfif>
		<!--- validate Domain --->
		<cfif form.RootDomain EQ ''>
			<cfset arrayAppend(aErrorMessages, 'Please provide a valid RootDomain') />
		</cfif>
		
		<!--- Lets check if aErrorMessages empty? --->
		<cfif ArrayIsEmpty(aErrorMessages)>
			<!---goon on form process coz no error --->
			
			<!---EXAMPLE INSERT INTO "SYSTEM"."LS_CERTIFICATES" (ID, DOMAIN_ID, SUB_DOMAIN_ID, DATE_EXPIRES) VALUES ('2', '1', '2', TO_TIMESTAMP('2018-01-29 17:49:07.766000000', 'YYYY-MM-DD HH24:MI:SS.FF'))
 --->
			
			<cfquery datasource="ORACLE_DEV">
				INSERT INTO LS_DOMAINS 
				(ID, ROOT_DOMAIN, DATE_CREATED, DATE_UPDATED, DATE_EXPIRES)
				VALUES 
				('#form.id#', '#form.RootDomain#', 
				<cfqueryparam value="#form.DateCreated#" cfsqltype="cf_sql_timestamp">,
				<cfqueryparam value="#form.DateUpdated#" cfsqltype="cf_sql_timestamp"  >,
				<cfqueryparam value="#form.DateExpires#" cfsqltype="cf_sql_timestamp">)
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
<cflocation url="INSERT_LS_DOMAINS.cfm">
</cfif>

<cfform id="insertLSDOMAINS" name= "insertLSDOMAINS" method="post" >
<fieldset style="display: inline-block">	 <legend>INSERT data to LS_DOMAINS table</legend>
<table style="width:auto">

  <tr>
    <th>Fields</th>
    <th>Data</th> 
  
  </tr>
  <tr>
    <td>ID:</td>
    <td><input type="text" name="id"  required ></td>
   
  </tr>
  <tr>
    <td>Root Domain:</td>
    <td><input type="text" name="RootDomain" size="35" required /> </td>
  
  </tr>
  <tr>
    <td>Date Created:</td>
    <td> <input type="text" name="DateCreated"  required  /></td>
 
  </tr>
  
    <tr>
    <td>Date Updated:</td>
    <td> <input type="text" name="DateUpdated"  required /></td>
  
  </tr>
  <tr>
    <td>Date Expires:</td>
    <td><input type="text"  name="DateExpires"  required /></td>
 
  </tr>
</table>


  <cfinput type="submit" name="SubmitLSDOMAINS" value="Submit">
   </fieldset>
</cfform> 

</body>
</html>
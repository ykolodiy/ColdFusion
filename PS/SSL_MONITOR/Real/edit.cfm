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
table {
    width: 100%;    
    background-color: #f1f1c1;
}
</style>
</head>
<body>


<!---Form processing Script --->
<cfif structKeyExists(form, 'SubmitEDITED')>
		<!---goon on form process and update 2 tables --->
			
			<cfquery datasource="ORACLE_DEV">
				UPDATE LS_DOMAINS 
				SET 
				DATE_EXPIRES =<cfqueryparam value="#form.DomainDateExpires#" cfsqltype="cf_sql_timestamp">
				WHERE
				ROOT_DOMAIN =  <cfqueryparam value="#form.RootDomain#" cfsqltype="CF_SQL_CHAR">
			</cfquery>

			<cfquery datasource="ORACLE_DEV">
				UPDATE LS_CERTIFICATES 
				SET 
				DATE_EXPIRES = <cfqueryparam value="#form.CertificateDateExpires#" cfsqltype="cf_sql_timestamp" NULL="#NOT len(form.CertificateDateExpires)#">
				WHERE
				DOMAIN_ID =  <cfqueryparam value="#form.DomainID#" cfsqltype="CF_SQL_NUMERIC">
			</cfquery>
				
			
			
			<!---redirect back to index.xfm --->
			<cfset variables.domainupdated = true />
	
</cfif>


<cfif structKeyExists(variables, 'domainupdated') AND variables.domainupdated >
	<cflocation url="index.cfm" >
</cfif>


<cfif isDefined("url.domainid") AND url.domainid NEQ '' AND IsNumeric(url.domainid)>
	
<cfset domainid = url.domainid />
	
<cfquery datasource="ORACLE_DEV" name="LS">
SELECT LS_DOMAINS.root_domain, LS_DOMAINS.ID ID,  LS_DOMAINS.date_expires DA, LS_CERTIFICATES.date_expires SA
FROM LS_DOMAINS
INNER JOIN LS_CERTIFICATES ON LS_DOMAINS.id = LS_CERTIFICATES.domain_id
where LS_DOMAINS.ID = #domainid#
</cfquery>

<h3>
	Please edit root domain and SSL certificate expiration dates
</h3>
<cfform id="updatetLSDOMAINS" name= "updatetLSDOMAINS" method="post" >
<table >
  <tr>
    <th>Action</th>
    <th>Root domain</th> 
	<th>Domain Expires</th> 
    <th>SSL Certificate Expires</th> 
  </tr>

  <cfoutput query="LS" group="ID">
  <tr>
    <td><cfinput type="submit" name="SubmitEDITED" value="Save"></td>
    <td>#LS.ROOT_DOMAIN#</td>
    <cfinput type="hidden" value="#LS.ROOT_DOMAIN#" name="RootDomain"  />
  
    <cfinput type="hidden" value="#ID#" name="DomainID"  />
    <td><cfinput type="timestamp"  name="DomainDateExpires"  value="#DateTimeFormat(LS.DA, "mm.dd.yyyy")#"  required /></td>
    <td><cfinput type="timestamp"  name="CertificateDateExpires"  value="#DateTimeFormat(LS.SA, "mm.dd.yyyy")#"  required /></td>
  </tr>
  </cfoutput>
</table>


</cfform> 

<cfelse>
<cflocation url="index.cfm" >
</cfif>


</body>
</html>
<cfcomponent>
<cfset email = "ivan" >
<cfset pass = "ivan" >
<cfset role = "1" >




<cffunction name="dologin" access="public" output="false" returntype="boolean" > 
<cfargument name="email" type="string" required="true">
<cfargument name="pass" type="string" required="true">
	
<cfset isloggedin = false />
	
	<cfif #arguments.email# EQ #variables.email# AND arguments.pass EQ #variables.pass#>
		

	
<!---login --->
<cflogin >
	<cfloginuser name="#email#" password="#pass#" roles="#role#" >
</cflogin>

<!---save data to session scope --->
<cfset session.structurelogin = {'email' = #email#, 'role'=#role#}>

<cfset isloggedin = true />
	</cfif>
<cfreturn isloggedin />
</cffunction>



<cffunction name="dologout" access="public" output="false" returntype="void">
	<cfset structdelete(session, 'structurelogin')>
	<!--- this tag of CF logs user out --->
	<cflogout />
</cffunction>


</cfcomponent>
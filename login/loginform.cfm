<!---https://www.youtube.com/watch?v=t7jogSuNfYo --->
<cfinclude template="doLogin.cfc" >

<cfif structkeyExists (url, "logout")>
	<cfset dologout() />
	
</cfif>

<cfif structkeyExists(form, 'submit') >
	<cfset isloggedinvar =  dologin(form.email, form.pass) />
</cfif>



<cfform id='formid' preservedata="true" >
	
	<cfif structkeyExists(variables, 'isloggedinvar') AND isloggedinvar EQ false>
		user not found
	</cfif>

	
	
<cfif structkeyExists(session, 'structurelogin')>
	Welcome 
	<cfoutput>#session.structurelogin.email#</cfoutput>
	 <a href="loginform.cfm?logout">Logout</a>
	
	<cfelse>

	
	Login <br>
	email<cfinput name="email" id="email" >
	pass<cfinput name="pass" id="pass" >
	<cfinput name="submit" type="submit" >
</cfif>
	
</cfform>


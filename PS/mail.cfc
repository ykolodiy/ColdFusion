<cfcomponent>

<cffunction name="sendMail" returntype="void" access="private" >
<cfmail from="cmrdmltv@gmail.com" subject="FAILED THIS ONE" to="yuriw@ukr.net" >
	"simplerequest error"
</cfmail>
</cffunction>



<cffunction name="sent" >
	<cfset sendMail() />
</cffunction>


</cfcomponent>

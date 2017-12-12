<!---This Function have being called in JeffVanity3.cfm, it  takes url as argument and goes thru upto 5 redirections and return yes if final destination is https and no if http--->
<cffunction name='httporhttps' returntype='string'>
<cfargument name='urlx' type="string"  required>
	
<!--- the First request --->	
<cfhttp
method="head"
url="#urlx#"
useragent="#CGI.http_user_agent#"
result="objGet1"
redirect="false" />
<!--- get and setup the 2nd url --->
<cfif StructKeyExists( objGet1.ResponseHeader, "Location" ) >
<!--- set correct Second url  --->
<cfif REFindNoCase("^/redirect", objGet1.ResponseHeader.Location)>
<cfset url2 = "https://www.pearsonschool.com"&"#objGet1.ResponseHeader.Location#">
<cfelseif  REFindNoCase("^//", objGet1.ResponseHeader.Location)>
<cfset url2 = "https:"&"#objGet1.ResponseHeader.Location#">
<cfelseif  REFindNoCase("^index", objGet1.ResponseHeader.Location)>
<cfset url2 = "https://www.pearsonschool.com/"&"#objGet1.ResponseHeader.Location#">
<cfelseif  REFindNoCase("^/index", objGet1.ResponseHeader.Location)>
<cfset url2 = "https://www.pearsonschool.com"&"#objGet1.ResponseHeader.Location#">
<cfelse>
<cfset url2 = objGet1.ResponseHeader.Location>
</cfif>
	

		    <!--- the Second request --->
		    <cfhttp
		    method="head"
		    url=#url2#
		    result="objGet2"
		    redirect="false"
		     useragent="#CGI.http_user_agent#" />
			<!--- get and setup the 3rd url --->
			<cfif StructKeyExists( objGet2.ResponseHeader, "Location" )>
			<!--- set correct url 3rd  --->
			<cfif REFindNoCase("^/redirect", objGet2.ResponseHeader.Location)>
			<cfset url3 = "https://www.pearsonschool.com"&"#objGet2.ResponseHeader.Location#">
			<cfelseif  REFindNoCase("^//", objGet2.ResponseHeader.Location)>
			<cfset url3 = "https:"&"#objGet2.ResponseHeader.Location#">
			<cfelseif  REFindNoCase("^index", objGet2.ResponseHeader.Location)>
			<cfset url3 = "https://www.pearsonschool.com/"&"#objGet2.ResponseHeader.Location#">
				<cfelseif  REFindNoCase("^/index", objGet2.ResponseHeader.Location)>
			<cfset url3 = "https://www.pearsonschool.com"&"#objGet2.ResponseHeader.Location#">
				<cfelse>
			<cfset url3 = objGet2.ResponseHeader.Location>
			</cfif>
	
	
				        <!--- the Third request --->
						<cfhttp
				        method="head"
				        url=#url3#
				        result="objGet3"
				        redirect="false"
				         useragent="#CGI.http_user_agent#" />
				        <!--- get and setup the 4th url --->
				        <cfif StructKeyExists( objGet3.ResponseHeader, "Location" )>
				        <!--- set correct url 4th  --->
						<cfif REFindNoCase("^/redirect", objGet3.ResponseHeader.Location)>
						<cfset url4 = "https://www.pearsonschool.com"&"#objGet3.ResponseHeader.Location#">
						<cfelseif  REFindNoCase("^//", objGet3.ResponseHeader.Location)>
						<cfset url4 = "https:"&"#objGet3.ResponseHeader.Location#">
						<cfelseif  REFindNoCase("^index", objGet3.ResponseHeader.Location)>
						<cfset url4 = "https://www.pearsonschool.com/"&"#objGet3.ResponseHeader.Location#">
						<cfelseif  REFindNoCase("^/index", objGet3.ResponseHeader.Location)>
						<cfset url4 = "https://www.pearsonschool.com"&"#objGet3.ResponseHeader.Location#">
						<cfelse>
						<cfset url4 = objGet3.ResponseHeader.Location>
						</cfif>
	
							       <!--- the 4th request --->
								   <cfhttp
							        method="head"
							        url=#url4#
							        result="objGet4"
							        redirect="false"
							         useragent="#CGI.http_user_agent#"  />
		        					 <cfif StructKeyExists( objGet4.ResponseHeader, "Location" )>
								    <!--- set correct url 5th  --->
										<cfif REFindNoCase("^/redirect", objGet4.ResponseHeader.Location)>
										<cfset url5 = "https://www.pearsonschool.com"&"#objGet4.ResponseHeader.Location#">
										<cfelseif  REFindNoCase("^//", objGet4.ResponseHeader.Location)>
										<cfset url5 = "https:"&"#objGet4.ResponseHeader.Location#">
										<cfelseif  REFindNoCase("^index", objGet4.ResponseHeader.Location)>
										<cfset url5 = "https://www.pearsonschool.com/"&"#objGet4.ResponseHeader.Location#">
										<cfelseif  REFindNoCase("^/index", objGet4.ResponseHeader.Location)>
										<cfset url5 = "https://www.pearsonschool.com"&"#objGet4.ResponseHeader.Location#">
										<cfelse>
										<cfset url5 = objGet4.ResponseHeader.Location>
										</cfif>
							
							
														<!--- the 5th request --->					
												        <cfhttp
												        method="head"
												        url=#url5#
												        result="objGet5"
												        redirect="false"
												        useragent="#CGI.http_user_agent#"  />
												      	<cfif StructKeyExists( objGet5.ResponseHeader, "Location" )>
				 										<cfelse>
											            <cfif REFindNoCase("^https", #url5#)>
														<cfreturn "YES">
														<cfelse>
														<cfreturn "NO">
														</cfif>
														</cfif>
							
												<cfelse>
									            <cfif REFindNoCase("^https", #url4#)>
												<cfreturn "YES">
												<cfelse>
												<cfreturn "NO">
												</cfif>
										</cfif>

	                            <cfelse>
  								<cfif REFindNoCase("^https", #url3#)>
								<cfreturn "YES">
								<cfelse>
								<cfreturn "NO">
								</cfif>
      					</cfif>

					<cfelse>
			        <cfif REFindNoCase("^https", #url2#)>
					<cfreturn "YES">
					<cfelse>
					<cfreturn "NO">
			        </cfif>
			</cfif>

	 <cfelse>
<cfreturn "NE">
     
</cfif>

</cffunction>



<!---check if final url has this https://www.pearsonschool.com/?acornRdt=1&acornRef=   its is hpme page of ps.com  what to do with this--->
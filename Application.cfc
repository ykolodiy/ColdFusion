the main Application component always execuded before requested page in the same dir
resource control... like servlet? can redirect if user is not admin ex
if error occurse Application.cfc can execute it

<cfcomponent output=false>
<cfset this.name=x>
<cfset this.applicationtimeout=createtimespan(2 0 0 0 0)>
<cfset this.datasource='dataStreet'>   //now u can omit datasource from cfquery tag and it use this one as default
<cfset this.customtagPAth=expandpath(cftraining/CustomtagDir)>   expandpath > convert relativ to absolute and viceversa
  now u can replace cfmodule template=/tags/front.cfm   with  <cf_front>

</cfcomponent>

ALL EVENTS here auto executed on events  
on app start
on app end
on session start
on session ends
on request on requeststart on requestend
on error


<cffunction name=onapplicationstart returntype=boolean>
<cfreturn true>    // it will know that start is finished
// create new instance and use everywhere
<cfset application.pageService = createObject('component', cftraining.components.pageservice)>

now in any page u can call
<cfset rspage=application.pageService.getpagebyid(1)>

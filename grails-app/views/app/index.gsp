<meta name="layout" content="app"/><%-- Temp workaround for Grails 3.0.0.M2 --%>
<div class="page-header">
	<h1>
		App Example
		<small>running on Facebook.com</small>
	</h1>
</div>
<g:if test="${!facebookContext.app.id}">
	<g:render template="/website/configError" />
</g:if>
<g:else>
	<!--
	  We use the Facebook JavaScript SDK to provide a richer user experience. For more info,
	  look here: http://github.com/facebook/facebook-js-sdk
	-->
	<facebook:initJS
			appId="${facebookContext.app.id}">
		// Put here any JS code to be executed after Facebook JS initialization
	</facebook:initJS>

	<g:if test="${!facebookContext.authenticated}">
		<g:render template="/loginJS"/>
	</g:if>
	<g:else>
		<g:render template="/userInfo"
				  model="[permissions: permissions, user: user]"/>
	</g:else>
	<p>&nbsp;</p>
</g:else>
<g:render template="/dialogs"/>
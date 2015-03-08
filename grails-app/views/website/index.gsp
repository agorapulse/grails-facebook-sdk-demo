<meta name="layout" content="website"/><%-- Temp workaround for Grails 3.0.0.M2 --%>
<div class="page-header">
	<h1>
        Website example
        <small>with Facebook Platform integration</small>
    </h1>
</div>
<g:if test="${!facebookContext.app.id}">
    <g:render template="/configError" />
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
        <div class="row">
            <div class="col-md-6">
                <g:render template="/loginJS"/>
            </div>
            <div class="col-md-6">
                <g:render template="/loginRedirect"/>
            </div>
        </div>
    </g:if>
    <g:else>
        <div class="row">
            <div class="col-md-6">
                <g:render template="/logoutJS"/>
            </div>
            <div class="col-md-6">
                <g:render template="/logoutRedirect"/>
            </div>
        </div>
    </g:else>
</g:else>
<g:render template="/dialogs"/>

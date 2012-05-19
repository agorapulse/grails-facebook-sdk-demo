<div class="page-header">
	<h1>Website example <small>with Facebook Platform integration</small></h1>
</div>
<div class="row">
	<div class="span10">
		<g:if test="${!facebook.app.id}">
			<g:render template="/website/configError" />
		</g:if>
		<g:else>
			<!--
			  We use the Facebook JavaScript SDK to provide a richer user experience. For more info,
			  look here: http://github.com/facebook/facebook-js-sdk
			-->
			<facebook:initJS appId="${facebook.app.id}">
				// Put here any JS code to be executed after Facebook JS initialization
			</facebook:initJS>
			
			<h2 class="tab">Authentication</h2>
			<g:if test="${facebook.authenticated}">
				<ul class="authentication">
                    <li>
                        <facebook:logoutLink elementClass="btn pull-right" nextUrl="${createLink(action:'logout')}">Logout</facebook:logoutLink>
                        Log out via Facebook JavaScript SDK:
                    </li>
                    <li>
                        <a href="${logoutUrl}" class="btn pull-right">
                            Logout
                        </a>
                        Log out Facebook.com server side redirect:
                    </li>
                </ul>
			</g:if>
			<g:else>
				<ul class="authentication">
                    <li>
                        <facebook:loginLink appPermissions="${facebook.app.permissions}" elementClass="large primary btn pull-right">Login</facebook:loginLink>
                        Log in via Facebook JavaScript SDK:<br />
                        (<i>with Facebook Grails SDK handling authorization code from cookie on reload</i>)
                    </li>
                    <li>
                        <a href="${loginUrl}" class="pull-right large btn">Login</a>
                        Log in via Facebook.com server side redirect:<br />
                        (<i>with Facebook Grails SDK handling authorization code from url on return</i>)
                    </li>
                </ul>
			</g:else>
			<p>&nbsp;</p>
			<g:if test="${user}">
				<h2 class="tab">Your data</h2>
				<h3>Your profile pic + name</h3>
				<p>
					<img src="https://graph.facebook.com/${user.id}/picture">
					${user.name}<br />
				</p>
				<h3>Your friends</h3>
				<p>
					<g:each in="${userFriends}" var="friend">
						<img src="https://graph.facebook.com/${friend.id}/picture">
					</g:each>
				</p>
			</g:if>
			<g:else>
				<strong><em>You are not Connected.</em></strong>
			</g:else>
			<p>&nbsp;</p>
		</g:else>
		<h2 class="tab">Public data</h2>
		<h3>Profile pic + name</h3>
		<p>
			<img src="https://graph.facebook.com/benorama/picture">
			${benorama?.name}
		</p>
	</div>
	<div class="span4">
		<g:render template="links" />
	</div>
</div>
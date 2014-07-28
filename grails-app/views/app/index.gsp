<div class="page-header">
	<h1>App Example <small>running on Facebook.com</small></h1>
</div>
<div class="row">
	<div class="span12">
		<g:if test="${!facebookContext.app.id}">
			<g:render template="/website/configError" />
		</g:if>
		<g:else>
			<!--
			  We use the Facebook JavaScript SDK to provide a richer user experience. For more info,
			  look here: http://github.com/facebook/facebook-js-sdk
			-->
			<facebook:initJS appId="${facebookContext.app.id}">
				// Put here any JS code to be executed after Facebook JS initialization
			</facebook:initJS>
			
			<g:if test="${!facebookContext.authenticated}">
				<h2 class="tab">Authentication</h2>
				<p>
					Install app via Facebook JavaScript SDK: <facebook:loginLink appPermissions="${facebookContext.app.permissions}" elementClass="large primary btn">Login</facebook:loginLink>
				</p>
			</g:if>
			<g:else>
                <h2 class="tab">Permissions</h2>
                <ul class="permissions">
                    <g:each in="${permissions}" var="permission">
                        <li>
                            ${permission.permission} (${permission.status})
                        </li>
                    </g:each>
                </ul>
				<h2 class="tab">Your data</h2>
				<h3>Your profile pic + name</h3>
				<p>
					<img src="https://graph.facebook.com/${user.id}/picture">
					${user.name}
				</p>
				<h3>Your friends</h3>
				<p>
					<g:each in="${userFriends}" var="friend">
						<img src="https://graph.facebook.com/${friend.id}/picture">
					</g:each>
				</p>
			</g:else>
			<p>&nbsp;</p>
		</g:else>
		<p>&nbsp;</p>
        <h2 class="tab">Facebook Dialogs</h2>
        <script type="text/javascript">
            function addToPage_callback(response) {alert(response && response.tabs_added.length + ' app added')};
            function invite_callback(response) {console.log(response)};
            function publish_callback(response) {if (response && response.success) alert('Published successfully')};
            function send_callback(response) {if (response && response.success) alert('Sent successfully')};
            function share_callback(response) {if (response && response.success) alert('Shared successfully')};
        </script>
        <facebook:addToPageLink callback="addToPage_callback" elementClass="btn">Add to page</facebook:addToPageLink>
        <facebook:inviteLink callback="invite_callback" elementClass="btn" message="Check this app!">Invite</facebook:inviteLink>
        <facebook:publishLink callback="publish_callback" elementClass="btn">Publish (legacy)</facebook:publishLink>
        <facebook:shareLink callback="share_callback" elementClass="btn" href="http://www.google.com">Publish (new)</facebook:shareLink>
        <facebook:sendLink callback="send_callback" elementClass="btn" link="http://www.google.com" to="594317994">Send a link to a friend</facebook:sendLink>
    </div>
</div>
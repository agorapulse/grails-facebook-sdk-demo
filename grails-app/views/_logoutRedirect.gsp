<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            Log out via Facebook.com server side redirect
        </h3>
    </div>
    <div class="panel-body">
        <a href="${facebookContext.getLogoutURL(next:createLink(action:'logout', absolute:true))}"
           class="btn  btn-default pull-right">
            Logout
        </a>
        <g:render template="/userInfo"
                  model="[permissions: permissions, user: user]"/>
    </div>
</div>
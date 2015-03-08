<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            Log out via Facebook JavaScript SDK
        </h3>
    </div>
    <div class="panel-body">
        <facebook:logoutLink
                elementClass="btn btn-default pull-right"
                nextUrl="${createLink(action:'logout')}">
            Logout
        </facebook:logoutLink>
        <g:render template="/userInfo"
                  model="[permissions: permissions, user: user]"/>
    </div>
</div>
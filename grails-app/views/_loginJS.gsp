<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            Log in via Facebook JavaScript SDK
        </h3>
    </div>
    <div class="panel-body">
        <p>
            <facebook:loginLink
                    appPermissions="${facebookContext.app.permissions}"
                    elementClass="btn btn-large btn-primary">
                Login
            </facebook:loginLink>
        </p>
        <small>
            Client-side, with Facebook Grails SDK handling authorization code from cookie on reload
        </small>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            Log in via Facebook.com server side redirect
        </h3>
    </div>
    <div class="panel-body">
        <p>
            <a class="btn btn-primary"
               href="${facebookContext.getLoginURL(redirect_uri: 'http://localhost:8080/website/index')}"
               role="button">
                Login
            </a>
        </p>
        <small>
            Server-side, with Facebook Grails SDK handling authorization code from url on return
        </small>
    </div>
</div>
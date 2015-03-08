<script type="text/javascript">
    function addToPage_callback(response) {alert(response && response.tabs_added.length + ' app added')};
    function invite_callback(response) {console.log(response)};
    function publish_callback(response) {if (response && response.success) alert('Published successfully')};
    function send_callback(response) {if (response && response.success) alert('Sent successfully')};
    function share_callback(response) {if (response && response.success) alert('Shared successfully')};
</script>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            Facebook dialog links
        </h3>
    </div>
    <div class="panel-body">
        <facebook:addToPageLink
                callback="addToPage_callback"
                elementClass="btn btn-default">
            Add to page
        </facebook:addToPageLink>
        <facebook:inviteLink
                callback="invite_callback"
                elementClass="btn btn-default"
                message="Check this app!">
            Invite
        </facebook:inviteLink>
        <facebook:publishLink
                callback="publish_callback"
                elementClass="btn btn-default">
            Publish (legacy)
        </facebook:publishLink>
        <facebook:shareLink
                callback="share_callback"
                elementClass="btn btn-default"
                href="http://www.google.com">
            Publish (new)
        </facebook:shareLink>
        <facebook:sendLink
                callback="send_callback"
                elementClass="btn btn-default"
                link="http://www.google.com" to="594317994">
            Send a link to a friend
        </facebook:sendLink>
    </div>
</div>
import grails.plugin.facebooksdk.FacebookContext
import grails.plugin.facebooksdk.FacebookGraphClient
import com.restfb.exception.FacebookOAuthException

class AppController {

    static defaultAction = 'index'
    static transactional = false

    FacebookContext facebookContext

    def beforeInterceptor = {
        log.info "START ${actionUri} with params=${params}"
    }
    def afterInterceptor = {
        log.info "END ${actionUri}"
    }

	def index() {
		// See if there is a user from a cookie or session
		def user
        List permissions = []
        List userFriends = []
		if (facebookContext.authenticated) {
            String token = facebookContext.user.token
            if (token) {
                FacebookGraphClient facebookGraphClient = new FacebookGraphClient(token)
                try {
                    user = facebookGraphClient.fetchObject(facebookContext.user.id.toString())
                    permissions = facebookGraphClient.fetchConnection("${facebookContext.user.id}/permissions")
                    if (permissions.find { it.permission == 'user_friends' && it.permission == 'granted' } ) {
                        userFriends = facebookGraphClient.fetchConnection("${facebookContext.user.id}/friends", [limit:10])
                    }
                } catch (FacebookOAuthException exception) {
                    facebookContext.user.invalidate()
                }
            }
		}
		
		[
                facebookContext: facebookContext,
                permissions: permissions,
                user: user,
                userFriends: userFriends
        ]
	}

}

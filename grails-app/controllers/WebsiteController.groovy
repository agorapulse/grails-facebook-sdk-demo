import com.restfb.exception.FacebookOAuthException
import grails.plugin.facebooksdk.FacebookContext
import grails.plugin.facebooksdk.FacebookGraphClient

class WebsiteController {

    static defaultAction = 'index'

    FacebookContext facebookContext

	def beforeInterceptor = {
        log.info "START ${actionUri} with params=${params}"
    }
	def afterInterceptor = {
        log.info "END ${actionUri}"
    }

	def index() {
		def user
        List permissions = []
		List userFriends = []
        if (facebookContext.app.id && facebookContext.authenticated) {
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
		
		// This call will always work since we are fetching public data.
		[
                facebookContext: facebookContext,
                permissions: permissions,
        		user: user,
				userFriends: userFriends
        ]
	}

	def logout() {
        facebookContext.user.invalidate()
		redirect action: 'index'
	}

	def welcome() {}

}

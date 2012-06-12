import com.restfb.exception.FacebookOAuthException
import grails.plugin.facebooksdk.FacebookGraphClient

class WebsiteController {
	
	def facebookAppService

	def beforeInterceptor = [action:this.&before]
	def afterInterceptor = [action:this.&after]

	def before() {
		log.info("START ${actionUri} with params=${params}")
	}

	def after(model) {
		log.info("END ${actionUri}")
	}

	def index() {
		FacebookGraphClient facebookGraphClient = new FacebookGraphClient()
		def user
		List userFriends = []
		if (request.facebook.authenticated) {
			try {
				String userAccessToken = facebookAppService.getUserAccessToken()
				facebookGraphClient = new FacebookGraphClient(userAccessToken)
				user = facebookGraphClient.fetchObject(request.facebook.user.id.toString())
				userFriends = facebookGraphClient.fetchConnection("${request.facebook.user.id}/friends", [limit:10])
			} catch (FacebookOAuthException exception) {
				// Usually an invalid session (OAuthInvalidTokenException), for example if the user logged out from facebook.com
				facebookAppService.invalidateUser()
				facebookGraphClient = new FacebookGraphClient()
			}
		}
		
		// Login or logout url will be needed depending on current user state.
		String logoutUrl
		String loginUrl
		if (request.facebook.app.id) {
			if (user) {
				logoutUrl = facebookAppService.getLogoutURL(next:createLink(action:'logout', absolute:true))
			} else {
				loginUrl = facebookAppService.getLoginURL(scope:request.facebook.app.permissions)
			}
		}
		
		// This call will always work since we are fetching public data.
		def benorama = facebookGraphClient.fetchObject('benorama')

		return 	[loginUrl:loginUrl,
				logoutUrl:logoutUrl,
				benorama:benorama,
				user:user,
				userFriends:userFriends]
	}

	def logout() {
		facebookAppService.invalidateUser()
		redirect(action:'index')
	}

	def welcome() {}

}

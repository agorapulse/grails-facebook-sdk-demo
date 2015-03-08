<!DOCTYPE html>
<html xmlns:fb="http://ogp.me/ns/fb#">
<head>
	<title><g:layoutTitle default="Facebook Grails SDK Website Example" /></title>
	<g:layoutHead />
    <asset:javascript src="application.js"/>
    <asset:stylesheet href="website.css"/>
    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>

<body>
	<g:render template="/navbar"/>

	<div class="container">
		<g:layoutBody />
		<hr/>
		<g:render template="/footer" />
	</div>
</body>
</html>
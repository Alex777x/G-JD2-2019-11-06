<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	<img src="${contextPath}/resources/img/fon-poker.png" alt="" class="rounded-pill">

<div class="container">
	<div class="row">
		<div class="col-sm logo1">
			<img class="img-thumbnail" src="${contextPath}/<sec:authentication property="foto" />" />
		</div>
		<div class="col-sm logo2">
			<img class="img-thumbnail" src="${contextPath}/<sec:authentication property="foto" />" />
		</div>
	</div>
</div>

<div class="logo3">
	<img class="img-thumbnail" src="${contextPath}/<sec:authentication property="foto" />" />
</div>
<div class="logo4">
	<img class="img-thumbnail" src="${contextPath}/<sec:authentication property="foto" />" />
</div>
<div class="logo5">
	<img class="img-thumbnail" src="${contextPath}/<sec:authentication property="foto" />" />
</div>
<div class="logo6">
	<img class="img-thumbnail" src="${contextPath}/<sec:authentication property="foto" />" />
</div>
<div class="logo7">
	<img class="img-thumbnail" src="${contextPath}/<sec:authentication property="foto" />" />
</div>
<div class="logo8">
	<img class="img-thumbnail" src="${contextPath}/<sec:authentication property="foto" />" />
</div>
<div class="logo9">
	<img class="img-thumbnail" src="${contextPath}/<sec:authentication property="foto" />" />
</div>
<div class="logo10">
	<img class="img-thumbnail" src="${contextPath}/<sec:authentication property="foto" />" />
</div>
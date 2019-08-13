<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="container">
	<div class="row">

		<div class="col-sm">

<%-- 			<form:form method="POST" action="${pagesPersonalArea}" modelAttribute="formChangeUserNickName"> --%>
<%-- 				<form:input path="id" type="hidden" /> --%>

<!-- 				<div class="form-group"> -->
<!-- 					<label for="nickname">NickName</label> -->
<%-- 					<form:input class="form-control" path="nickname" type="text" /> --%>
<%-- 					<form:errors path="nickname" cssClass="red-text" /> --%>
<!-- 				</div> -->

<!-- 				<button class="btn btn-primary" type="submit">Save</button> -->
<%-- 				<a class="btn btn-primary" href="${pagesPersonalArea}">Back</a> --%>
<%-- 			</form:form> --%>

		</div>


		<div class="col-sm"></div>


	</div>
</div>



<div>
	<form method="POST" enctype="multipart/form-data" action="${contextPath}/file">
		<table>
			<tr>
				<td>File to upload:</td>
				<td><input type="file" name="file" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Upload" /></td>
			</tr>
		</table>
	</form>

	<img alt="no image" src="${contextPath}/file/image" />
</div>

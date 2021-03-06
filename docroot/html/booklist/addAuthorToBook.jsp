<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<portlet:defineObjects />

<portlet:renderURL var="backURL">
	<portlet:param name="mvcPath" value="${backURL}"></portlet:param>
	<portlet:param name="bookId" value="${book.getId()}" />
	<portlet:param name="mode" value="editBook" />
</portlet:renderURL>

<table>
	<tr>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Birth Date</th>
		<th>Email</th>
		<th></th>
	</tr>
	<c:forEach items="${book.getRelatedAuthors()}" var="currAuthor">
		<portlet:actionURL name="unbindBookAndAuthor" var="removeAuthorForBookURL">
			<portlet:param name="mvcPath" value="${backURL}" />
			<portlet:param name="bookId" value="${book.getId()}"/>
			<portlet:param name="authorId" value="${currAuthor.getAuthorId()}"/>
		</portlet:actionURL>
		<tr>
			<td class="main-table-td">${currAuthor.getFirstName()}</td>
			<td class="main-table-td">${currAuthor.getLastName()}</td>
			<td class="main-table-td">${currAuthor.getBirthDate()}</td>
			<td class="main-table-td">${currAuthor.getEmail()}</td>
			<td>
				<a class="btn" href="${removeAuthorForBookURL}">Remove</a>
			</td>
		</tr>
	</c:forEach>
	<c:forEach items="${otherAuthors}" var="currAuthor">
		<portlet:actionURL name="bindBookAndAuthor" var="addAuthorForBookURL">
			<portlet:param name="mvcPath" value="${backURL}" />
			<portlet:param name="bookId" value="${book.getId()}"/>
			<portlet:param name="authorId" value="${currAuthor.getAuthorId()}"/>
		</portlet:actionURL>
		<tr>
			<td class="main-table-td">${currAuthor.getFirstName()}</td>
			<td class="main-table-td">${currAuthor.getLastName()}</td>
			<td class="main-table-td">${currAuthor.getBirthDate()}</td>
			<td class="main-table-td">${currAuthor.getEmail()}</td>
			<td>
				<a class="btn" href="${addAuthorForBookURL}">Add</a>
			</td>
		</tr>
	</c:forEach>
</table>
<a class="btn" href="${backURL}">Cancel</a>

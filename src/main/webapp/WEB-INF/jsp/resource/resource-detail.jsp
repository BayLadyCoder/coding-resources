<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="../include/header.jsp"/>
<div>
    <img
            class="resource-img"
            src="${resource.imageUrl}"
            class="rounded-start"
            alt="..."
    />
    <h1 class="card-title">${resource.name}</h1>
    <p>${resource.description}</p>
    <table class="table table-bordered">
        <!-- <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">First</th>
          </tr>
        </thead> -->
        <tbody>
        <tr>
            <th>Type</th>
            <td>Web Application</td>
        </tr>
        <tr>
            <th>Price</th>
            <td>Free</td>
        </tr>
        <tr>
            <th>Features</th>
            <td>Text-Based Learning, Online Editor</td>
        </tr>
        <tr>
            <th>Categories</th>
            <td>
                <c:set var="count" value="1" scope="page"/>
                <c:forEach items="${resource.resourceCategories}" var="resourceCategory">
                    ${resourceCategory.category.name}<c:if test="${count < resource.resourceCategories.size()}">,</c:if>
                    <c:set var="count" scope="page" value="${count + 1}"/>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <th>Topics</th>
            <td>
                <c:set var="count" value="1" scope="page"/>
                <c:forEach items="${resource.resourceTopics}" var="resourceTopics">
                    ${resourceTopics.topic.name}<c:if test="${count < resource.resourceTopics.size()}">,</c:if>
                    <c:set var="count" scope="page" value="${count + 1}"/>
                </c:forEach>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="mt-4">
        <c:choose>
            <c:when test="${resource.isAdded == 1}">
                <a href="/user-list/remove-resource?userListId=${sessionScope.userListId}&resourceId=${resource.id}"
                   class="btn btn-outline-danger">REMOVE FROM LIST</a>
            </c:when>
            <c:otherwise>
                <a href="/user-list/add-resource?userListId=${sessionScope.userListId}&resourceId=${resource.id}"
                   class="btn btn-primary">+ ADD TO LIST</a>
            </c:otherwise>
        </c:choose>
        <a
                href="${resource.url}"
                target="_blank"
                class="btn btn-secondary"
                onclick="event.stopPropagation();"
        >START LEARNING</a
        >
    </div>
</div>


<%-- Reviews --%>
<div class="mt-5">
    <h2>Reviews</h2>
    <form class="w-100" action="">
          <textarea
                  class="w-100"
                  placeholder="Share your experience with this resource..."
                  class="form-control"
                  id="exampleFormControlTextarea1"
                  rows="5"
          ></textarea>
        <button class="btn btn-primary" type="submit">ADD REVIEW</button>
    </form>
    <div>
        <div
                class="border border-success border-opacity-25 rounded-3 border px-4 py-3 my-4"
        >
            <p>
                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus
                nesciunt, qui eum porro totam, odio corrupti reiciendis eos
                tempore a eius, quo distinctio. Explicabo consectetur consequuntur
                quae ex quod harum.
            </p>
            <p>User1</p>
            <small class="small">25 July, 2024</small>
        </div>
        <div
                class="border border-success border-opacity-25 rounded-3 border px-4 py-3 my-4"
        >
            <p>
                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus
                nesciunt, qui eum porro totam, odio corrupti reiciendis eos
                tempore a eius, quo distinctio. Explicabo consectetur consequuntur
                quae ex quod harum.
            </p>
            <p>User2</p>
            <small class="small">25 July, 2024</small>
        </div>
        <div
                class="border border-success border-opacity-25 rounded-3 border px-4 py-3 my-4"
        >
            <p>
                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ducimus
                nesciunt, qui eum porro totam, odio corrupti reiciendis eos
                tempore a eius, quo distinctio. Explicabo consectetur consequuntur
                quae ex quod harum.
            </p>
            <p>User3</p>
            <small class="small">25 July, 2024</small>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>

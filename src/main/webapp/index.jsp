<%--
  Created by IntelliJ IDEA.
  User: nuvia
  Date: 20.06.2016
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%--<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Spring MVC and List Example</h2>

<c:if test="${not empty lists}">

    <ul>
        <c:forEach var="listValue" items="${lists}">
            <li>${listValue}</li>
        </c:forEach>
    </ul>

</c:if>
</body>
</html>--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Infonal</title>
    <link rel="stylesheet" href="/styles/index.css" />
    <link rel="stylesheet" type="text/css" href="styles/sweetalert.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

</head>
<body>
<div class="navbar navbar-inverse navbar-fixed">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Infonal</a>
        </div>
        <div class="collapse navbar-collapse" id="bs">
            <ul class="nav navbar-nav">
                <%-- <li class="active"><a href="/">Home</a></li>--%>
            </ul>
        </div>
    </div>
</div>

<div class="container">
    <div class="text-center">
        <h1>User Management System</h1>
        <p class="lead">This is a list of all users in our systems</p>
    </div>

    <div class="container">
        <!-- Filter notes list by member name -->
        <form action="/" method="post">
            <div class="row clearfix">

                <div class="col-md-8 column">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="New User">New Record</button>
                </div>
            </div>
        </form>
    </div>

</div>
<br/>
<div class="container">
    <div class="col-md-12 column list-group">

        <c:forEach items="${lists}" var="list">
            <div class="list-group-item">

                <div><strong>Name: </strong>${list.name}</div>


                    <a href="/deleteUser?id=${ list.id }" class="confirmation">
                    <button id="deleteRecord" class="pull-right btn btn-warning">Delete</button>
                    </a>

                <a href="/editUser?id=${ list.id }">
                    <button id="editRecord" class="pull-right btn btn-warning">Edit</button>
                </a>

                <div><strong>Surname: </strong>${list.surName} </div>
                <div><strong>Phone: </strong>${list.phone}</div>

            </div>
        </c:forEach>
    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">New User</h4>
            </div>
            <div class="modal-body">
                <form id="saveRecord" role="form">
                    <div class="form-group">
                        <label for="user-name" class="control-label">Name</label>
                        <input type="text" class="form-control" name="name" id="user-name" required>
                    </div>
                    <div class="form-group">
                        <label for="user-surname" class="control-label">Surname</label>
                        <input type="text" class="form-control" name="surname" id="user-surname" required>
                    </div>
                    <div class="form-group">
                        <label for="user-phone" class="control-label">Phone</label>
                        <input type="text" class="form-control phone" name="phone" id="user-phone">
                    </div>

                    <div class="form-group">
                        <label for="number" class="control-label">What is three plus four?</label>
                        <input name="number" class="form-control" id="number" required="required" pattern="7" title="Please answer the question to prove you are human">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary submitter">Save</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="js/sweetalert.min.js"></script>
<script src="js/jquery.input.mask.js"></script>
<script src="js/jquery.mask.js"></script>
<script src="js/index.js"></script>


</body>

</html>


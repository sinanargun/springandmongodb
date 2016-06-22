<%--
  Created by IntelliJ IDEA.
  User: nuvia
  Date: 22.06.2016
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${user.name}</title>

    <link rel="stylesheet" href="/styles/index.css" />
    <link rel="stylesheet" type="text/css" href="styles/sweetalert.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

</head>
<body>
<div class="modal fade" id="exampleModalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelEdit">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabelEdit">Edit User</h4>
            </div>
            <div class="modal-body">

                <form id="editUser" role="form">

                    <div class="form-group hide">
                        <label for="edit-id" class="control-label">Id</label>
                        <input type="text" class="form-control" name="id" id="edit-id" value="${user.id}">
                    </div>

                    <div class="form-group">
                        <label for="edit-name" class="control-label">Name</label>
                        <input type="text" class="form-control" name="name" id="edit-name" value="${user.name}">
                    </div>
                    <div class="form-group">
                        <label for="edit-surname" class="control-label">Surname</label>
                        <input type="text" class="form-control" name="surname" id="edit-surname" value="${user.surName}">
                    </div>
                    <div class="form-group">
                        <label for="edit-phone" class="control-label">Phone</label>
                        <input type="text" class="form-control phone" name="phone" id="edit-phone" value="${user.phone}">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-close" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary btn-ok">Save</button>
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
<script src="js/edit.js"></script>
</body>
</html>

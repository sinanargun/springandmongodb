/**
 * Created by nuvia on 22.06.2016.
 */
$( document ).ready(function() {

    $('#exampleModalEdit').modal('show');

    $('.phone').mask("(999) 999-99-99", { placeholder: "(___) ___-__-__" });

    $('#exampleModalEdit .btn-close').click(function () {
        $.ajax({
            type: 'GET',
            url: '/getUsers',
            success: function(r) {
                if ( r ) {
                  window.location.href = '/getUsers';
                } else {
                    alert('Please try again');
                }
            }
        });
    });

    $('#exampleModalEdit .btn-ok').on("click", function(event) {
        event.preventDefault();
        $('#exampleModalEdit').modal('hide');
        
        var data = $('#editUser').serialize();
        $.ajax({
            type: 'POST',
            url: '/editUser',
            data: data,
            success: function(r) {
                //console.log(r);
                if ( r ) {

                    swal({   title: "Good Job",
                            text: "You have updated the recorded user!",
                            type: "success",
                            showCancelButton: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "OK",
                            closeOnConfirm: false },
                        function(){
                            window.location.href = '/getUsers';
                        });
                    
                } else {
                    alert('Please try again');
                }
            }
        });
    });

    $('#exampleModalEdit .close').on("click", function(event) {
        event.preventDefault();
        window.location.href = '/getUsers';
    });

});
var initial= {

    boot: function() {
        
        $('#saveRecord').submit(function(e) {
            e.preventDefault();
            initial.saveUser();
        });


        $('.phone').mask("(999) 999-99-99", { placeholder: "(___) ___-__-__" });

        $('.confirmation').click(function(e){
            if(confirm('Are you sure?')){
                swal("Good job!", "You have deleted the user!", "success");
            } else {
                // The user pressed Cancel, so prevent the link from opening
                e.preventDefault();
            }
        });
    },

    saveUser: function() {
        event.preventDefault();
        $('#exampleModal').modal('hide');
        var data = $('#saveRecord').serialize();

        $.ajax({
            type: 'POST',
            url: '/save',
            data: data,
            dataType: "json",
            success: function(r) {
                if ( r ) {

                    swal({   title: "Good Job",
                        text: "You have added a new user!",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "OK",
                        closeOnConfirm: false },
                        function(){
                            window.location.href = '/getUsers';
                        });


                } else {
                    alert('Please check your information!');
                }
            }
        });
    }


};

$(document).ready(function(){
    initial.boot();

});


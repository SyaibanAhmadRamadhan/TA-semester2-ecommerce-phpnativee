$(document).ready(function(){
    // event ketika keyword ditulis
    
    $('#keyword').on('keyup',function(){
        // munculin loding
        // $('.loader').show();

        // load
        // $('#container').load('../method/ajax/sepeda.php?keyword=' + $('#keyword').val());
        
        // get
        $.get('./components/search.php?keyword=' + $('#keyword').val(), function(data){
            $('#container').html(data);
            // $('.loader').hide();
        });
        
    });
})
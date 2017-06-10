$(document).ready(function(){
    $("li>.button.special").click(function(event){
        event.preventDefault();
        $("li>.button.special").fadeOut(function(){
            $("li>.button.special").remove();
            $("li>.button.special.spec").addClass('spec1');
        });
        
    });
});
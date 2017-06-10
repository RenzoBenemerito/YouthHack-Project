$(document).ready(function(){
    $("li>.button.special").click(function(event){
        event.preventDefault();
        $("li>.button.special").fadeOut();
        //$("li>.button.special").remove();
    });
});
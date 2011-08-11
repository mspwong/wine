// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
    $("#add_tag").click(function(){
//        var sibling = $(this).prev().prev();
//        sibling.css("background-color", "red");
//        var tag = $('input[id="wine_tags_attributes_1_name"');
        var tag = $('p.my_tag input[type="text"]').last();
        tag.css("background-color", "red");
    });
})

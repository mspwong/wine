// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
    $("#add_tag").click(function(){
        var tag = $('p.my_tag').last();
        var num_tags = $('p.my_tag').length;
        tag.parent().append('<p class="my_tag"><input id="wine_tags_attributes_' + num_tags + '_name" name="wine[tags_attributes][' + num_tags + '][name]" size="30" type="text" value=""><label for="wine_tags_attributes_' + num_tags + '__destroy">Remove:</label><input name="wine[tags_attributes][' + num_tags + '][_destroy]" type="hidden" value="0"><input id="wine_tags_attributes_' + num_tags + '__destroy" name="wine[tags_attributes][' + num_tags + '][_destroy]" type="checkbox" value="1"></p>');
    });
})

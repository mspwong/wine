$(function() {
    $("#get_wines").click(function(){
        $.ajax({
          url: '/why_nots/get_wines',
          type: 'GET',
          dataType: 'json',
          success: function(data, textStatus, jqXHR) {
            var dataStr = "";
            for (var i=0;  i<data.length; ++i) {
                dataStr += "<p>" + JSON.stringify(data[i]) + "</p>";
            }
            $("#ajax_response").html(dataStr);
          },
          error: function(jqXHR, textStatus, errorThrown) {
            alert("error:  " + errorThrown);
          }
        });
    });

    $("#get_wine").click(function(){
        var wine_id = $("#wine_id").val().trim();
        if (!wine_id) {
            alert ("must first enter the wine id");
            return;
        }
        $.ajax({
          url: '/why_nots/get_wine' + "?id=" + wine_id,
          type: 'GET',
          dataType: 'json',
          success: function(data, textStatus, jqXHR) {
            $("#ajax_response").html("<p>" + JSON.stringify(data) + "</p>");
          },
          error: function(jqXHR, textStatus, errorThrown) {
            alert("error:  " + errorThrown);
          }
        });
    });
});
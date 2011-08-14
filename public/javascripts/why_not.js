$(function() {
    $.ajaxSetup({
        async: true,
        timeout: 50000,              // for server-side debug during dev
        dataType: 'json',
        beforeSend: function() {
            $("#ajax_response").html("");
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert("ajax error: " + errorThrown + ",     status code: " + jqXHR.status);
        }
    });

    $("#get_wines").click(function(){
        $.ajax({
          url: '/why_nots/get_wines',
          type: 'GET',
          success: function(data, textStatus, jqXHR) {
            if (jqXHR.status == 204) {
                alert("no data found");
                return;
            }

            var dataStr = "";
            for (var i=0;  i<data.length;  ++i) {
//                if (i==6) continue;
                dataStr = dataStr + "<p>" + JSON.stringify(data[i]) + "</p>";
            }
            $("#ajax_response").html(dataStr);
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
          success: function(data, textStatus, jqXHR) {
              if (jqXHR.status == 204) {
                  alert("no data found");
                  return;
              }

              $("#ajax_response").html("<p>" + JSON.stringify(data) + "</p>");
          }
        });
    });

    $("#post_wine").click(function(){
        var wine_id = $("#post_wine_id").val().trim();
        if (!wine_id) {
            alert ("must first enter the wine id");
            return;
        }
        $.ajax({
          url: '/why_nots/post_wine',
          data: {id: wine_id},
          type: 'POST',
          success: function(data, textStatus, jqXHR) {
              if (jqXHR.status == 204) {
                  alert("no data found");
                  return;
              }

            $("#ajax_response").html("<p>" + JSON.stringify(data) + "</p>");
          }
        });
    });
});
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
});
$(function() {
    $("#ajax_this").click(function(){
        $.ajax({
          url: '/why_nots/ajax_this',
          type: 'GET',
          dataType: 'json',
          success: function(data, textStatus, jqXHR) {
            var dataStr = "";
            for (var i=0;  i<data.length; ++i) {
                dataStr += JSON.stringify(data[i]) + "\n";
            }
            $("#ajax_response").html(dataStr);
          },
          error: function(jqXHR, textStatus, errorThrown) {
            alert("error:  " + errorThrown);
          }
        });
    });
});
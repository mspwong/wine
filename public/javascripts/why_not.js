$(function() {
    $.ajaxSetup({
        async: true,
//        timeout: 2000,
        dataType: 'json',
        global: true,
        beforeSend: function() {
            $("#ajax_response").html("");
        },
        success: function(textStatus, xmlHttpRequest, data) {
            if (xmlHttpRequest.status == 204) {
                alert("no data found");
                return true;
            }
            return false;
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert("ajax error: " + errorThrown + ",     status code: " + jqXHR.status);
        }
    });

    $("#get_wines").click(function() {
        $.ajax({
            url: '/why_nots/get_wines',
            type: 'GET',
            success: function(data, textStatus, jqXHR) {
                if ($.ajaxSettings.success.call(this, textStatus, jqXHR, data))
                    return;

                var dataStr = "";
                for (var i = 0; i < data.length; ++i) {
//                    if (i == 6) continue;
                    dataStr = dataStr + "<p>" + JSON.stringify(data[i]) + "</p>";
                }
                $("#ajax_response").html(dataStr);
            }
        });
    });

    $("#get_wine").click(function() {
        var wine_id = $("#wine_id").val().trim();
        if (!wine_id) {
            alert("must first enter the wine id");
            return;
        }
        $.ajax({
            url: '/why_nots/get_wine' + "?id=" + wine_id,
            type: 'GET',
            success: function(data, textStatus, jqXHR) {
                if ($.ajaxSettings.success.call(this, textStatus, jqXHR, data))
                    return;

                $("#ajax_response").html("<p>" + JSON.stringify(data) + "</p>");
            }
        });
    });

    $("#post_wine").click(function() {
        var wine_id = $("#post_wine_id").val().trim();
        if (!wine_id) {
            alert("must first enter the wine id");
            return;
        }
        $.ajax({
            url: '/why_nots/post_wine',
            data: {id: wine_id},
            type: 'POST',
            success: function(data, textStatus, jqXHR) {
                if ($.ajaxSettings.success.call(this, textStatus, jqXHR, data))
                    return;

                $("#ajax_response").html("<p>" + JSON.stringify(data) + "</p>");
            }
        });
    });
});
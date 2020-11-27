$(document).ready(function () {
    var dtToday = new Date();

    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if (month < 10)
        month = '0' + month.toString();
    if (day < 10)
        day = '0' + day.toString();
    $('#dss').empty();
    var minDate = year + '-' + month + '-' + day;

    $('#dateInput').attr('min', minDate);
    $('#dateInput').val(minDate);
    $('#dateInput').change(function () {
        $("#dateRendewVous").empty();
        $("#dateRendewVous").html($(this).val());
        RendezVousofDate($(this).val())
    })

});




function Annuler(idRendez) {
    id = "#" + idRendez;
    $(id).next().remove();
    $.ajax({
        url: "/app/patient/CancelAppointment",
        type:"put",
        data: {idRendezVous: idRendez},
        success: function (rendez) {
        },
        error: function (e) {
            alert(e.responseText);
            console.log("ERROR: ", e);

        },
        done: function (e) {
            console.log("DONE");
        }
    });
    $(id).next().remove();
    $(id).remove();
}







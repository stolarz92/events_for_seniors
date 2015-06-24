var ready = function() {
    if ($('body.events').length) {
        //alert("Page generated by the projects controller.");

/* Timepicker and datepicker when adding new event */
        $('.time').timepicker({
            'showDuration': true,
            'timeFormat': 'H:i',
            'show2400': true,
            'scrollDefault': "08:00"
        });
        var timeElement = document.getElementById('timepair');
        var timepair = new Datepair(timeElement);

        $('.input-daterange').datepicker({
            'language': "pl",
            'todayHighlight': true,
            'format': 'dd-mm-yyyy',
            'autoclose': true
        });

/* Datepicker for changing date in events */
        $('.date').datepicker({
            'language': "pl",
            'todayHighlight': true,
            'format': 'dd-mm-yyyy',
            'autoclose': true
        })
    }

/* Search date */
    if ($('body.homepage').length) {
        $('.date').datepicker({
            'language': "pl",
            'todayHighlight': true,
            'format': 'dd-mm-yyyy',
            'autoclose': true
        })
    }

};

$(document).ready(ready);
$(document).on('page:load', ready);
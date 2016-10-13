# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#search_project').chosen(width: '400px')
    $('#search_client').chosen(width: '400px')
    
    # The code in the brackets augments the names of the days to be 3 letters, rather than the stnd 2
    $('#search_from_date').datepicker({
    dayNamesMin: [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
    changeYear: true
    dateFormat: "d M yy"
    defaultDate: "-1y"
    })
    $('#search_to_date').datepicker({
    dayNamesMin: [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
    changeYear: true
    dateFormat: "d M yy"
    })
    projects = $('#search_project').html()
    $('#search_client').change ->
        client = $('#search_client :selected').map(() ->
            return $(this).text();
        ).get().join().split(',');
        # escaped_client = client.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        # options = $(projects).filter("optgroup[label='#{escaped_client}']").html()
        options_array = []
        for c in client
            options_array.push $(projects).filter('optgroup[label="'+c+'"]').html()
        if options_array
            $('#search_project').html(options_array.join(''))
        else
            $('#search_project').empty()
        $('#search_project').trigger('chosen:updated');
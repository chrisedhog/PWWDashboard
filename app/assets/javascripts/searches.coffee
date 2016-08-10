# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#search_project').chosen(width: '400px')
    $('#search_client').chosen(width: '400px')
    projects = $('#search_project').html()
    $('#search_client').change ->
        client = $('#search_client :selected').text()
        # escaped_client = client.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        # options = $(projects).filter("optgroup[label='#{escaped_client}']").html()
        options = $(projects).filter("optgroup[label='#{client}']").html()
        if options
            $('#search_project').html([options])
        else
            $('#search_project').empty()


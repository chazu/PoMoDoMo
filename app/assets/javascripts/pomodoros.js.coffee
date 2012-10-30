# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('.pomodoro_dialog').dialog
    autoOpen: false
    modular: true


  $('.create_pomodoro').live 'click', ->
    $.ajax
      type: "GET"
      url: 'pomodoros/new'
      success: ->
        $('.pomodoro_dialog').dialog('open')

  $('.start_pomodoro').live 'click', ->
    $.ajax
      type: "GET"
      url: "pomodoros/#{$('.pomodoro_id').val()}/start_cycle"
  
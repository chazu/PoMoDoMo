# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  time = new Date()
  time.setMinutes( time.getMinutes() + 25)
  console.log(time)
  $('#countdown_timer').countdown(until: time)
  
  Pomodomo.errors = {
    clear_error_fields: ->
      $('.errorExplanation').html('').hide()

    handle_ajax_errors: (errors_array, entity_type) ->
      errors_array = JSON.parse(errors_array)
      error_string = ""
      error_number = 0
      for key,value of errors_array
        for error in value          
          error_number += 1
          error_string += "<li>#{key[0].toUpperCase()}#{key.substr(1, key.length - 1)} #{error}</li>"   

      $('.errorExplanation').html("<h2>#{error_number} error(s) prevented this #{entity_type} from being saved:</h2>
        <p>There were problems with the following fields:</p>
        <ul>
          #{error_string}
        </ul>
      ").show()
  }
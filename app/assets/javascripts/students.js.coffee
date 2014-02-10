# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#student_admission_date').datepicker({
    defaultDate: 100,
    dateFormat: 'yy-mm-dd',
    minDate: new Date(new Date().getTime() - (3* 365 * 1000 * 60 * 60 * 24)),
    maxDate: new Date(new Date().getTime() + (7 * 1000 * 60 * 60 * 24))
  })

  $('#student_date_of_birth').datepicker({
    defaultDate: -10000,
    dateFormat: 'yy-mm-dd',
    minDate: new Date(new Date().getTime() - (40 * 365 * 1000 * 60 * 60 * 24)),
    maxDate: new Date(new Date().getTime() - (15 * 365 * 1000 * 60 * 60 * 24))
  })


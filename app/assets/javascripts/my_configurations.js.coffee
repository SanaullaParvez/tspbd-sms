# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#my_configuration_financial_year_start_date').datepicker({
    defaultDate: 100,
    dateFormat: 'yy-mm-dd',
    minDate: new Date(new Date().getTime() - (15 * 365 * 1000 * 60 * 60 * 24)),
    maxDate: new Date(new Date().getTime() + (5 * 365 * 1000 * 60 * 60 * 24))
  })

  $('#my_configuration_financial_year_end_date').datepicker({
    defaultDate: -10000,
    dateFormat: 'yy-mm-dd',
    minDate: new Date(new Date().getTime() - (15 * 365 * 1000 * 60 * 60 * 24)),
    maxDate: new Date(new Date().getTime() + (5 * 365 * 1000 * 60 * 60 * 24))
  })


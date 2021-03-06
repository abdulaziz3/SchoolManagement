
$(document).on "turbolinks:load",  ->
  $('.subject-select').parent().hide()
  $('.label-select').parent().hide()
  subj = $('.subject-select').html()
  $('.grade-select').change ->
    grad = jQuery('.grade-select').children('option').filter(':selected').text()
    escaped_make = grad.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(subj).filter("optgroup[label='#{escaped_make}']").html()
    if options
      $('.subject-select').html(options)
      $('.subject-select').parent().show()
      $('.label-select').parent().show()
    else
      $('.subject-select').empty()
      $('.subjcet-select').parent().hide()
      $('.label-select').parent().hide()

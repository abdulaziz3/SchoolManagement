# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load",  ->
  

#\\$(document).on "turbolinks:load",  ->
#\\  $('.selectHomework').parent().hide()
#\\  $('.label_homework').parent().hide()
#\\  $('.selectStudent').parent().hide()
#\\  $('.label_student').parent().hide()
#\\  $('.selectMak').parent().hide()
#\\  $('.label_mark').parent().hide()
#\\  home = $('.selectHomework').html()
#\\  $('.selectSubject').change ->
#\\    subj = jQuery('.selectSubject').children('option').filter(':selected').text()
#\\    escaped_make = subj.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
#\\    options = $(home).filter("optgroup[label='#{escaped_make}']").html()
#\\    if options
#\\      $('.selectHomework').html(options)
#\\      $('.selectHomework').parent().show()
#\\      $('.label_homework').parent().show()
#\\      $('.selectStudent').parent().show()
#\\      $('.label_student').parent().show()
#\\      $('.selectMak').parent().show()
#\\      $('.label_mark').parent().show()
#\\    else
#\\      $('.selectHomework').empty()
#\\      $('.selectHomework').parent().hide()
#\\      $('.label_homework').parent().hide()
#\\      $('.selectStudent').parent().hide()
#\\      $('.label_student').parent().hide()
#\\      $('.selectMak').parent().hide()
#\\      $('.label_mark').parent().hide()
#\\

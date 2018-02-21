# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load",  ->
  url = document.location.href
  homeWorkValue =  url.substring(url.indexOf("homeworkValue="),url.indexOf("&")).substring(14)
  subjectValue =  url.substring(url.indexOf("subjectValue=")).substring(13)

  if(subjectValue.length > 0 && subjectValue.length < 4)
    # $('.selectHomwork').empty()
    document.getElementById('post_marks_subject_id').value = subjectValue
    home = $('.selectHomwork').html()
    subj = jQuery('.selectSubject').children('option').filter(':selected').text()
    escaped_make = subj.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(home).filter("optgroup[label='#{escaped_make}']").html()
    if options
      options = "<option value=''>Select Homework</option>" + options
      $('.selectHomwork').parent().show()
      $('.homeworklabel').parent().show()
      $('.hm_label').parent().show()
      $('.selectHomwork').html(options)
    else
      $('.selectHomwork').empty()
      $('.selectHomwork').parent().hide()
      $('.homeworklabel').parent().hide()
      $('.hm_label').parent().hide()
  else
    $('.selectHomwork').parent().hide()
    $('.homeworklabel').parent().hide()
    $('.hm_label').parent().hide()

  if(homeWorkValue.length > 0 && homeWorkValue.length < 4)
    document.getElementById('post_marks_homework_id').value = homeWorkValue

  # $('.selectStudent').parent().hide()
  # $('.stud_label').parent().hide()
  # $('.selectMark').parent().hide()
  # $('.mark_label').parent().hide()
  # $('#studentMarksList').hide()
  home = $('.selectHomwork').html()
  $('.selectSubject').change ->
    subjectValue = $('.selectSubject').val();
    document.location.href = "/marks/new?subjectValue="+subjectValue;

    subj = jQuery('.selectSubject').children('option').filter(':selected').text()
    escaped_make = subj.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(home).filter("optgroup[label='#{escaped_make}']").html()

    if options
      options = "<option value=''>Select Homework</option>" + options
      $('.selectHomwork').html(options)
      $('.selectHomwork').parent().show()
      $('.homeworklabel').parent().show()
      $('.hm_label').parent().show()
      $('.selectStudent').parent().show()
      $('.stud_label').parent().show()
      $('.selectMark').parent().show()
      $('.mark_label').parent().show()
      # $('#studentMarksList').show()
    else

      $('.selectStudent').parent().hide()
      $('.stud_label').parent().hide()
      $('.selectMark').parent().hide()
      $('.mark_label').parent().hide()
      $('#studentMarksList').hide()

  $('.selectHomwork').change ->
    homeworkValue = $('.selectHomwork').val();
    subjectValue = $('.selectSubject').val();
    document.location.href = "/marks/new?homeworkValue="+homeworkValue+"&subjectValue="+subjectValue;

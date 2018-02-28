# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  url = document.location.href
  gradeValue = url.substring(url.indexOf("gradeValue=")).substring(11)

  if(gradeValue.length > 0 && gradeValue.length < 4)
    document.getElementById('post_subject_id').value = gradeValue

  $('.selectGradeForAttend').change ->
    gradeValue = $('.selectGradeForAttend').val();
    document.location.href = "/student_attendances/new?gradeValue="+gradeValue;

  $('#dateFieldAttendance').change ->
    $('#dateHidden').val($('#attendance_date').val())

# var d = new Date(date);
# d.setDate(d.getDate());
# return new Date(d);

# $('#txtDate').datepicker('setDate', 'today');
# $('#dateHidden').val($('#attendance_date').datepicker('setDate', new Date()))
# $('#dateHidden').val($('#attendance_date').val())

# $(document).on "turbolinks:load", ->
#   url = document.location.href
#   gradeValue =  url.substring(url.indexOf("gradeValue=")).substring(11)
#
#   if(gradeValue.length == 1)
#     document.getElementById('post_subject_id').value = gradeValue
#     grade = ('.studentAttendanceList').html
#     $('.selectGradeForAttend').change ->
#     gradeValue = $('.selectGradeForAttend').val();
#     document.location.href = "/student_attendances/new?gradeValue="+gradeValue;
#
#     attend = jQuery('.selectGradeForAttend').children('option').filter(':selected').text()
#     escaped_make = attend.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
#     option = $(grade).filter("optgroup[label='#{escaped_make}']").html()
#
#     if option
#       $('.studentAttendanceList').html(option)
#       $('.studentAttendanceList').parent().show()
#     else
#       $('.studentAttendanceList').hide()

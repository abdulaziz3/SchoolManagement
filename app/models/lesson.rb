class Lesson < ActiveRecord::Base

  mount_uploader :lesson_file, LessonFileUploader # to make sure to use the uploader on lesson_file

  belongs_to :subject

  def file_name
  lesson_file.path.split("/").last
  end
  
end

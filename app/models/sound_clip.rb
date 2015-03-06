# == Schema Information
#
# Table name: sound_clips
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  attachment  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class SoundClip < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  mount_uploader :attachment, AttachmentUploader
  
  after_destroy :remove_file_directory
    
  validates :title, presence: true
  validates :attachment, presence: true
  
  def to_jq_upload
      {
        "name" => read_attribute(:attachment),
        "size" => attachment.size,
        "url" => attachment.url,
        "delete_url" => "/sound_clips/#{id}",
        "delete_type" => "DELETE" 
      }
  end

  protected


   def remove_file_directory
      path = File.expand_path(attachment.store_path, attachment.root)
      FileUtils.remove_dir(path, force: false)
   end

end

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
  mount_uploader :attachment, AttachmentUploader
  
  after_destroy :remove_id_directory
    
  validates :title, presence: true
  validates :attachment, presence: true

  protected
  
  def remove_id_directory
   FileUtils.remove_dir("#{Rails.root}/public/uploads/sound_clip/attachment/#{id}", :force => true)
  end

end

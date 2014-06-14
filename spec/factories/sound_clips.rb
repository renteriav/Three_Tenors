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

# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sound_clip do
    title "MyString"
    description "MyString"
    attachment "MyString"
  end
end

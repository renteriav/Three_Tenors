# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  location         :string(255)
#  address          :string(255)
#  city             :string(255)
#  zip              :string(255)
#  date             :date
#  time             :time
#  ticket_link      :string(255)
#  location_website :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    location "MyString"
    address "MyString"
    city "MyString"
    zip "MyString"
    date "2014-05-28"
    time "2014-05-28 17:18:05"
    ticket_link "MyString"
    location_website "MyString"
  end
end

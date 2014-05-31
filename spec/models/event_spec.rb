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

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end

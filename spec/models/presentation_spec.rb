# == Schema Information
#
# Table name: presentations
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  slug        :string(255)
#  event_id    :integer
#  speaker_id  :integer
#  slide_link  :string(255)
#  video_link  :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Presentation do
  pending "add some examples to (or delete) #{__FILE__}"
end

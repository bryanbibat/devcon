# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authentication < ActiveRecord::Base
  belongs_to :user

  def self.find_by_provider_and_uid(provider, uid)
    where(provider: provider, uid: uid).first
  end
end

class Authentication < ActiveRecord::Base
  belongs_to :user

  def self.find_by_provider_and_uid(provider, uid)
    where(provider: provider, uid: uid).first
  end
end

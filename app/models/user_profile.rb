class UserProfile
  include Mongoid::Document
  mount_uploader :photo, AvatarUploader
  field :gamertag, type: String

  embedded_in :user
end

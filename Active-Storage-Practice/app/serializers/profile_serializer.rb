class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :image
  def image
    object.image.url
  end

end

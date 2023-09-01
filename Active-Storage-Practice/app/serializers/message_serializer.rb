class MessageSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :images

  def images
    object.images.map do |data|
      data.url
    end
  end
end

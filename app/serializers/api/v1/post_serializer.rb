module Api 
  module V1 
   class PostSerializer < ActiveModel::Serializer
    attributes :id, :content, :post_user

    def post_user
      object.user.username
    end
   end
  end
end
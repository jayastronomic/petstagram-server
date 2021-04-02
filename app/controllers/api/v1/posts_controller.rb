module Api 
    module V1
        class PostsController < ApplicationController
            def index
                posts = Post.all
                render json: { status: 'SUCCESS', posts: posts }
            end
        end
    end
end
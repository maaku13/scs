class Post < ApplicationRecord
    after_commit do |post|
        # Get the total number of post with same name
        nameTotalPosts = Post.where("name='"+post.name+"'").count()
        # Get blog record with entered name
        blogRecord = Blog.find_by(name: post.name)
        
        # If nill, create one record
        if blogRecord == nil
            Blog.create(name: post.name, counter: nameTotalPosts)
        else
            blogRecord.counter = nameTotalPosts
            blogRecord.save
        end
    end
end

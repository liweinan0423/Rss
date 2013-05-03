class PostsController < ApplicationController

  def new
    @channel = Channel.find params[:channel_id]
    @post = @channel.posts.build
  end

  def create
    @channel = Channel.find params[:channel_id]
    @post = @channel.posts.build params[:post] do |p|
      p.image = params[:image].read if params[:image]
    end
    @post.author = 'current_username'
    respond_to do |format|
      if @post.save
        format.html { redirect_to channel_post_path(@channel, @post), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find params[:id] 
  end

  def show_image
    @post = Post.find params[:post_id]
    send_data @post.image, :type => 'image/jpeg', :disposition => :inline, :content_length => @post.image.length
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]

    respond_to do |format|
      if @post.update_attributes params[:post]
        format.html { redirect_to channel_post_path(@post.channel, @post), notice: 'Post was successfully updated' }
        format.json { head :no_content }
      else
        format.html { render action: :edit }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    Post.delete params[:id]

    redirect_to channel_path(params[:channel_id])
  end

end

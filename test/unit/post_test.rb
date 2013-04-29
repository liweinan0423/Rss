require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "set blank author to post will be anonymous" do
    post_with_nil_author = Post.create(:title => 'sss', :content => 'content', :author => nil)
    post_with_blank_author = Post.create(:title => 'sss', :content => 'content', :author => '')

    assert post_with_nil_author.author == 'anonymous'
    assert post_with_blank_author.author == 'anonymous'
  end

  test "set author to post" do
    post = Post.create(:title => 'sss', :content => 'content', :author => 'author1')

    assert post.author == 'author1'

  end
end

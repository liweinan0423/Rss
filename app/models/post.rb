class Post < ActiveRecord::Base
  belongs_to :channel
  attr_accessible :content, :title, :image, :author

  validates :title, :content, :presence => true

  def author=(author)
    if author == '' or author == nil
      @author = 'anonymous'
    else
      @author = author
    end
  end

  def author
  	if @author == '' or @author == nil
      'anonymous'
    else
      @author
    end
  end
end

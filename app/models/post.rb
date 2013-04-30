class Post < ActiveRecord::Base
  belongs_to :channel
  attr_accessible :content, :title, :image, :author

  validates :title, :content, :presence => true
  
  after_save :send_broadcast

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

  private 
    def send_broadcast
      begin
        push_client = ::RSS::PushClient.new "http://10.32.152.132:8080/Androidpn/ws/nfws"

        push_client.send_broadcast '', title, content, ''
      rescue Exception
        logger.warn "Cannot connect to the push server...."
      end
    end
end

xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @channel.name
    xml.description @channel.description
    xml.link channel_url(@channel, :rss)
    
    for article in @channel.posts.order('created_at desc')
      xml.item do
        xml.title article.title
        xml.description article.content
        xml.pubDate article.created_at.to_s(:db)
        xml.link article.image ? channel_post_image_url(@channel, article) : ''
        xml.guid channel_post_url(@channel, article)
        xml.author article.author
      end
    end
  end
end
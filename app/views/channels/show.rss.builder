xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @channel.name
    xml.description @channel.description
    xml.link channel_url(@channel, :rss)
    
    for article in @channel.posts
      xml.item do
        xml.title article.title
        xml.description article.content
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link channel_post_url(@channel, article)
        xml.guid channel_post_url(@channel, article)
      end
    end
  end
end
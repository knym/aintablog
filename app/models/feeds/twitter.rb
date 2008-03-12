class Twitter < Feed
  
  has_many :tweets, :foreign_key => :feed_id, :dependent => :destroy
  
  def create_posts!
    entries.each do |entry|
      tweet = tweets.build :permalink => entry.urls.first, :content => entry.content.gsub(/\A\w*:\s/, '')
      tweet.created_at = entry.try(:date_published)
      tweet.save
    end
  end
    
end
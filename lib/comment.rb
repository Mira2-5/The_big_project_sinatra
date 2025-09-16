require 'csv'

class Comment
  attr_accessor :gossip_id, :content, :author

  def initialize(gossip_id, content, author=nil)
    @gossip_id = gossip_id
    @content = content
    @author = author
  end

  def save
    CSV.open('db/comments.csv', 'ab') do |csv|
      csv << [@gossip_id, @content, @author]
    end
  end

  def self.find_by_gossip_id(gossip_id)
    comments = []
    CSV.read('db/comments.csv').each do |row|
      if row[0].to_i == gossip_id
        comments << Comment.new(row[0].to_i, row[1], row[2])
      end
    end
    comments
  end

  def self.delete_by_gossip_id(gossip_id)
    comments = CSV.read('db/comments.csv').reject { |row| row[0].to_i == gossip_id }
    CSV.open('db/comments.csv', 'wb') do |csv|
      comments.each { |row| csv << row }
    end
  end
end


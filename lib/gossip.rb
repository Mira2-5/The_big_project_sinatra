require 'csv'

class Gossip
  attr_accessor :id, :author, :content

  def initialize(author, content, id=nil)
    @id = id
    @author = author
    @content = content
  end

  def self.all
    gossips = []
    CSV.read('db/gossips.csv').each_with_index do |row, index|
      gossips << Gossip.new(row[0], row[1], index)
    end
    gossips
  end

  def self.find(id)
    all[id]
  end
  
  def save
  CSV.open('db/gossips.csv', 'ab') do |csv|
    csv << [author, content]
  end
end


  def self.update(id, author, content)
    gossips = Gossip.all
    gossips[id].author = author
    gossips[id].content = content
    CSV.open('db/gossips.csv', 'wb') do |csv|
      gossips.each { |g| csv << [g.author, g.content] }
    end
  end

  def self.delete(id)
    gossips = Gossip.all
    gossips.delete_at(id)
    CSV.open('db/gossips.csv', 'wb') do |csv|
      gossips.each { |g| csv << [g.author, g.content] }
    end
  end
end


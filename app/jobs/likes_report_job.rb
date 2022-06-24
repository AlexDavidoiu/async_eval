require 'date'
require 'csv'

class LikesReportJob < ApplicationJob
  queue_as :default

  FILE = "./test.csv"
  HEADERS = [:date, :likes]

  def parse_date(date)
    Date.parse(date)
  end

  def get_likes(user) 
    Like.select { |like| like.post.user_id == user.id }
  end

  def write_to_csv(start_date, end_date, likes)
    CSV.open(FILE, 'w+', write_headers: true, headers: HEADERS) do |writer|
      (start_date..end_date).each do |date|
        likes_count = likes.select { |like| like.created_at.strftime("%d/%m/%Y") == date.strftime("%d/%m/%Y") }.count
        writer << [date.strftime("%d/%m/%Y"), likes_count] 
      end
    end
  end
  
  def perform(user_id, start_date, end_date)
    user = User.find(user_id)

    parsed_start_date, parsed_end_date = parse_date(start_date), parse_date(end_date)
    
    likes = get_likes(user)

    write_to_csv(parsed_start_date, parsed_end_date, likes)
  end

end
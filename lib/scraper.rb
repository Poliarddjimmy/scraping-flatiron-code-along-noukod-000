require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end

  def print_courses
      self.make_courses
      Course.all.each do |course|
<<<<<<< HEAD

=======
        
>>>>>>> 2c4108ae281228278d4e2c30dc1f0e7d20d99ad6
        if course.title
          puts "Title: #{course.title}"
          puts "  Schedule: #{course.schedule}"
          puts "  Description: #{course.description}"
        end
      end
    end
end

<<<<<<< HEAD
Scraper.new.print_courses
=======
Scraper.new.print_courses
>>>>>>> 2c4108ae281228278d4e2c30dc1f0e7d20d99ad6

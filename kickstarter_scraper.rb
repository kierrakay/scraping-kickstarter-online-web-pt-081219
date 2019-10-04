# require libraries/modules here
require "nokogiri" 
require "pry"


# def create_project_hash
#   html = File.read('fixtures/kickstarter.html')
#   kickstarter = Nokogiri::HTML(html)
 
#   projects = {}
 
#   # Iterate through the projects
#   kickstarter.css("li.project.grid_4").each do |project|
#     projects[project] = {}
#   end
 
#   # return the projects hash
#   projects
# end
     
      #refactor of above is below so it doesnt give huge nokogir object judt keys (title) and values (hash)
 def create_project_hash
    html = File.read('fixtures/kickstarter.html')
    kickstarter = Nokogiri::HTML(html)
   
  projects = {}
 
    kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
         :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end
 #using the to_sym method. Remember that symbols make better hash keys than strings.
 
  # return the projects hash
  projects
end
 
 

 
create_project_hash
# type project(whatever the class for html is and go in terminal with this after finding what you need to save it ... project_location=_ will save the last info in this case location into a variable)

 # projects: kickstarter.css("li.project.grid_4")
 
 # title: project.css("h2.bbcard_name strong a").text
 
 # image link: project.css("div.project-thumbnail a img").attribute("src").value
 
 # location: project.css("ul.project-meta span.location-name").text
 
 #description: 
 
 # percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i  #.gsub("%","").to_i takes percent away and converts to interger so 77% turns to 77
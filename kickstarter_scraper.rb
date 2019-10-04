# require libraries/modules here
require "nokogiri" 
require "pry"


def create_project_hash
  
  html = File.read('fixtures/kickstarter.html')
  
  kickstarter = Nokogiri::HTML(html)
  binding.pry
end

 
create_project_hash
# type project(whatever the class for html is and go in terminal with this after finding what you need to save it ... project_location=_ will save the last info in this case location into a variable)
 # projects: kickstarter.css("li.project.grid_4")
 
 # title: project.css("h2.bbcard_name strong a").text
 
 # image link: project.css("div.project-thumbnail a img").attribute("src").value
  
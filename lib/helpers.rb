include Nanoc::Helpers::Capturing
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Text
include Nanoc::Helpers::Blogging

def optimize_rjs
  system 'node node_modules/.bin/r.js -o build.js include=requirejs'
end

# Enumerate items belonging to a menu identified by id.
def menu(id)
  children = @items.select do |i|
    (i[:menu] && i[:menu].to_sym == id.to_sym)
  end.sort_by { |i| i[:position].to_i || 0 }
  children.each { |item| yield item } unless children.empty?
end

# Optional date formatting
def display_date(date)
  date.strftime('%h %d, %Y')
end

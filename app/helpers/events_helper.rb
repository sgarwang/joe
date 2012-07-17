module EventsHelper
  
  def category_options
      Category.all.map{ |c| [c.name, c.id] }
  end  
end

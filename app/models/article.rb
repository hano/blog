class Article < ActiveRecord::Base
  attr_accessible :author, :content, :title

  validates :author , :content, :presence => true
  validates :author , :length => { :maximum => 2 }
  
  
  def author_with_content
    "#{author} wrote: #{content}".html_safe
  end
  
  def author_with_content_merge
    "#{author} wrote...: #{content}".html_safe
  end
  
  #def as_json(params)
  #  { :author_with_content_merge => author_with_content_merge}.merge(attributes)
  #end
  
end

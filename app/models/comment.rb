class Comment < ActiveRecord::Base
  bad_attribute_names :changed
    
  has_many :field_data_comment_bodies, :foreign_key => 'entity_id', :order => 'entity_id DESC'
    
  def last_modified
    attributes['changed']
  end

  def body
    data.comment_body_value unless data.nil?
  end
  
  def body_format
    d = data
    d.comment_body_format unless d.nil?
  end
  
  private
  
  def data
    field_data_comment_bodies.find_by_entity_id(cid)
  end
end

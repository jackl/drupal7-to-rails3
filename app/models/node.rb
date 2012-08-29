class Node < ActiveRecord::Base
  bad_attribute_names :changed
    
  has_many :node_revisions, :foreign_key => "nid", :order => 'nid DESC,vid DESC'
  
  has_many :field_data_bodies, :foreign_key => 'entity_id', :order => 'entity_id DESC,revision_id DESC'


  has_many :field_data_uploads, :foreign_key => 'entity_id', :order => 'entity_id DESC,revision_id DESC'
  alias_attribute :attachments, :field_data_uploads
      
  has_many :comments, :foreign_key => "nid", :order => 'cid ASC'
  
  default_scope :order => 'created DESC'
  
  
  def self.find_sti_class(type_name)
    ActiveSupport::Dependencies.constantize(type_name.camelize)
  end

  def as_json(options)
    # this example ignores the user's options
    super(:only => [:title, :created], :methods => [:last_modified, :body, :body_format])
  end


  def body
    data.body_value unless data.nil?
  end
  
  def last_modified
    attributes['changed']
  end
  
  def body_format
    d = data
    d.body_format unless d.nil?
  end
  
  private
  
  def data
    latest_revision = node_revisions.first
    field_data_bodies.find_by_entity_id_and_revision_id(latest_revision.nid, latest_revision.vid) unless latest_revision.nil?  
  end
end

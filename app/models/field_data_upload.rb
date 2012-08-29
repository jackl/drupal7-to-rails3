class FieldDataUpload < ActiveRecord::Base
    alias_attribute :description, :upload_description
    
    has_one :file_managed, :foreign_key => 'fid', :primary_key => 'upload_fid'
    alias_attribute :file, :file_managed
end

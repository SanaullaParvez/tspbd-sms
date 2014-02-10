class SchoolDetail < ActiveRecord::Base
  attr_accessible :logo
  has_attached_file :logo,
                    :styles => { :original=> "150x110#"},
                    :url => "/assets/:class/school_logo.:extension",
                    :path => ":rails_root/app/assets/images/:class/school_logo.:extension",
                    :default_url => "/assets/default_logo.png",
                    :default_path  => ":rails_root/app/assets/images/:class/default_logo.png"

  VALID_IMAGE_TYPES = ['image/gif', 'image/png','image/jpeg', 'image/jpg']

  validates_attachment_content_type :logo, :content_type =>VALID_IMAGE_TYPES,
                                    :message=>'Image can only be GIF, PNG, JPG',:if=> Proc.new { |p| !p.logo_file_name.blank? }
  validates_attachment_size :logo, :less_than => 512000,
                            :message=>'must be less than 500 KB.',:if=> Proc.new { |p| p.logo_file_name_changed? }

end

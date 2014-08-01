class Upload < ActiveRecord::Base
  has_attached_file :image, styles: {
    large:    '1500x1500>',
    medium:   '300x300>',
    thumb:    '100x100>'
  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :adventure
end

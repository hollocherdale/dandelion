class Upload < ActiveRecord::Base
  has_attached_file :image, styles: {
    original: '4000x4000>',
    large:    '1500x1500>',
    medium:   '300x300>',
    small:    '200x200>',
    thumb:    '100x100>'
  }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :adventure
end

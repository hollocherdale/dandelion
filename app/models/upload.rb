class Upload < ActiveRecord::Base
  belongs_to :chapter
  has_attached_file :image,
                    styles: {
                    medium:   '500x500>',
                    thumb:    '100x100>'},
                    :storage => :s3
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

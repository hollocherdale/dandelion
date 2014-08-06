class Upload < ActiveRecord::Base
  belongs_to :adventure
  has_attached_file :image, styles: {
                    large:    '1500x1500>',
                    thumb:    '100x100>'
                    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

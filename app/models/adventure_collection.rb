class AdventureCollection < ActiveRecord::Base
  has_many :adventures
  has_attached_file :banner, styles: {
                    large:    '1000x200>',
                    thumb:    '100x100>'
                    }
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
end

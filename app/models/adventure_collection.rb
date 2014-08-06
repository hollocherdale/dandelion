class AdventureCollection < ActiveRecord::Base
  has_many :adventures
  has_attached_file :banner, styles: {
                    large:    '1500x400>',
                    thumb:    '100x100>'
                    }
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/
end

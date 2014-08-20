class Book < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  # missing_url = ENV['S3_BUCKET_PATH'] + ENV['S3_BUCKET_NAME'] + '/banners/missing.png'
  has_attached_file :banner,
                    styles: {
                    large:    '1500x400>',
                    thumb:    '100x100>'},
                    # default_url: missing_url,
                    :storage => :s3
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  def has_no_seed
  	if self.first_adventure.nil?
  	  true
  	else
  	  false
  	end
  end

  def first_adventure
  	self.chapters.all[0]
  end
end

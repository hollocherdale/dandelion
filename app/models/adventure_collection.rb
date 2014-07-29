class AdventureCollection < ActiveRecord::Base
  has_many :adventures
  has_attached_file :banner,
                    styles: {
                    large:    '1500x400>',
                    thumb:    '100x100>'},
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
    {:bucket => ENV['S3_DANDELION_BUCKET'],
      :access_key_id => ENV['S3_ACCESS_KEY_ID'],
      :secret_access_key => ENV['S3_SECRET_KEY_ID']}
  end
end

class Upload < ActiveRecord::Base
  belongs_to :adventure
  has_attached_file :image,
                    styles: {
                    medium:   '500x500>',
                    thumb:    '100x100>'},
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def s3_credentials
    {:bucket => ENV['S3_DANDELION_BUCKET'],
      :access_key_id => ENV['S3_ACCESS_KEY_ID'],
      :secret_access_key => ENV['S3_SECRET_KEY_ID']}
  end
end

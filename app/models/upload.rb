class Upload < ActiveRecord::Base
  belongs_to :adventure
  has_attached_file :image, styles: {
                    large:    '1500x1500>',
                    thumb:    '100x100>'
                    },
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME_DEVELOPMENT'],
                    :s3_credentials => {
                             :access_key_id => ENV['S3_ACCESS_KEY_ID'],
                             :secret_access_key => ENV['S3_SECRET_ACCESS_KEY']
                         },
                   :s3_permissions => 'private',
                   :url => ":s3_domain_url"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

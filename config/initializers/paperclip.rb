Paperclip::Attachment.default_options.merge!({
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                             :access_key_id => ENV['S3_ACCESS_KEY_ID'],
                             :secret_access_key => ENV['S3_SECRET_ACCESS_KEY']
                         },
                   :s3_permissions => 'private',
                   :url => ":s3_domain_url",
                   :s3_host_name => 's3-us-west-2.amazonaws.com'
                 })
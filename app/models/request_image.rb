# == Schema Information
#
# Table name: request_images
#
#  id                 :integer          not null, primary key
#  request_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class RequestImage < ActiveRecord::Base

  belongs_to :request

  # Attached file through paperclip with AWS S3 storage
  has_attached_file :image,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png",
                    storage: :s3,
                    s3_credentials: {access_key_id: ENV["AWS_ACCESS_KEY_ID"],
                                     secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]},
                    bucket: ENV["S3_BUCKET_NAME"]

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

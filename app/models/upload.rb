class Upload < ApplicationRecord
  has_attached_file :file

  do_not_validate_attachment_file_type :file
  validates :file, attachment_presence: true

  belongs_to :user

  def generate_tiny_url
    tiny_url = TinyUrl.new
    tiny_url.upload_id = id
    tiny_url.code = generate_randon_code
    tiny_url.save!
  end

  private
  def generate_randon_code
    SecureRandom.alphanumeric
  end
end

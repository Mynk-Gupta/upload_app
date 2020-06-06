class Upload < ApplicationRecord
  has_attached_file :file

  do_not_validate_attachment_file_type :file
  validates :file, attachment_presence: true

  belongs_to :user
  has_one :tiny_url

  def generate_tiny_url
    tiny_url = TinyUrl.where(upload_id: id).first
    if tiny_url
    else
      tiny_url = TinyUrl.new
      tiny_url.upload_id = id
      tiny_url.code = generate_randon_code
      tiny_url.save!
    end
  end

  def tiny_url
    return TinyUrl.where(upload_id: id).first.try(:code)
  end

  private
  def generate_randon_code
    SecureRandom.alphanumeric
  end
end

require 'state_machine'

class Adventure < ActiveRecord::Base
  before_save :destroy_image?

  before_validation :clear_photo

  has_ancestry
  belongs_to :user
  has_many :votes
  has_attached_file :photo, :styles => { :large => "700x700", :medium => "300x300>", :thumb => "100x100>" }
  validates :user_id, presence: true
  validates :story, presence: true
  validates :choice, presence: true

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  state_machine :initial => :pending do
    event :archive do
      transition :pending => :archived
    end
  
    event :publish_open do
      transition :pending => :published_open 
    end

    event :publish_close do
      transition :published_open => :published_close
    end
  end

  def delete_photo=(value)
    @delete_photo = !value.to_i.zero?
  end
  
  def delete_photo
    !!@delete_photo
  end

  def clear_photo
    self.photo = nil if delete_photo? && !photo.dirty?
  end

  def destroy_image?
    self.image.clear if @delete_photo == "1"
  end

  alias_method :delete_photo?, :delete_photo
end

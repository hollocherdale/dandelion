require 'state_machine'

class Book < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  belongs_to :users
  
  has_attached_file :banner,
                    styles: {
                    large:    '1500x400>',
                    thumb:    '100x100>'},
                    :storage => :s3
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  def has_no_seed
  	if self.first_chapter.nil?
  	  true
  	else
  	  false
  	end
  end

  state_machine initial: :pending do
    event :publish do
      transition pending: :published
    end
  end


  def first_chapter
  	self.chapters.all[0]
  end
end

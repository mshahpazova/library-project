require 'file_size_validator'
class Book < ActiveRecord::Base
  validates :page_count, :presence => true
  validates :genre, :presence => true
  validates :title, :presence => true
  scope :descending, -> { order 'created_at DESC' }
  # Tells rails to use this uploader for this model.
  mount_uploader :attachment, AttachmentUploader 
    validates :attachment, 
      :presence => true, 
      :file_size => { 
      :maximum => 1.megabyte
      } 



  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%").all
    else
      find(:all)
    end
  end

end


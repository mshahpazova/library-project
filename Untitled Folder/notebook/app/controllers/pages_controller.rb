class PagesController < ApplicationController
before_action :current_user
before_action :current_page
before_action :all_photos

  def new_photo
    @photo = Photo.new
  end

  def upload_photo
    uploaded_io = params[:picture]
    File.open(
      Rails.root.join(
        'public', 'uploads', uploaded_io.original_filename
      ), 'wb') do |file|
        file.write(uploaded_io.read)
        current_page.photos.create(path: file.path)
      end    
  end   
  
  def all_photos
    @photos = @current_page.photos 
  end

  def serve
     ph_id = params[:ph_id]
     photo = Photo.find(ph_id)
     File.open(photo.path, 'rb') do |f|
      send_data f.read, :type => 'image/jpeg', :disposition => 'inline'
    end
    # debugger
    # send_file photo.path, :type => 'image/jpeg', :disposition => 'inline'
  end       

  def current_page
    @current_page = @current_user.pages.find(params[:id])
  end
end
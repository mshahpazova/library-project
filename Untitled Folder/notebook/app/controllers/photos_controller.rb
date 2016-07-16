class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    uploaded_io = params[:picture]
    File.open(
      Rails.root.join(
        'public', 'uploads', uploaded_io.original_filename
      ), 'wb') do |file|
        file.write(uploaded_io.read)
        Photo.create(path: file.path)
      end
  end

  def show
    @photo = Photo.find(params[:id])
  end
end

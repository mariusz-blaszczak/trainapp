class RecordsController < ApplicationController
  def create
    path = Rails.public_path.join(params[:audio])
    File.open(path, 'wb') { |f| f.write(params[:audio_file].read) }
    render nothing: true
  end
end

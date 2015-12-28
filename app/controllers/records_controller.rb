class RecordsController < ApplicationController
  def create
    File.open(file_path, 'wb') { |f| f.write(params[:audio_file].read) }
    render nothing: true
  end

  private

  def file_path
    Rails.public_path.join(params[:audio])
  end
end

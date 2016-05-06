require 'rails_helper'
require 'carrierwave/test/matchers'

describe AudioUploader do
  include CarrierWave::Test::Matchers
  let(:exercise) { double('exercise') }
  let(:uploader) { described_class.new(exercise, :audio) }
  let(:path_to_file) { Rails.root.join('spec/fixtures/audio', 'test_audio.wav') }
  before do
    described_class.enable_processing = true
    File.open(path_to_file) { |f| uploader.store!(f) }
  end

  after do
    described_class.enable_processing = false
    uploader.remove!
  end

  it 'has the correct format' do
    expect(uploader.file.extension).to eq('wav')
  end

  it 'changes filename to random' do
    expect(uploader.file.basename).to_not eq('test_audio')
  end
end

require 'rails_helper'

describe ExerciseDecorator do
  subject { described_class.new(exercise) }
  let(:exercise) { build(:exercise, double_sided: double_sided)}
  describe 'double_sided_human' do
    context 'double sided is true' do
      let(:double_sided) { true }
      it { expect(subject.double_sided_human).to eq('Dwustronne') }
    end

    context 'double sided is false' do
      let(:double_sided) { false }
      it { expect(subject.double_sided_human).to eq('Jednostronne') }
    end
  end
end

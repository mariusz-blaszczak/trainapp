class ExerciseDecorator < Draper::Decorator
  delegate_all

  def double_sided_human
    case double_sided
    when true
      'Dwustronne'
    when false
      'Jednostronne'
    end
  end
end

module PomodorosHelper
  def current_cycle(current_li)
    pomodoro_length = @pomodoro.pomodoro_cycles.length
    case current_li
    when '1'
      'current' if pomodoro_length == 1
    when 'break_1'
      'current' if pomodoro_length == 2
    when '2'
      'current' if pomodoro_length == 3
    when 'break_2'
      'current' if pomodoro_length == 4
    when '3'
      'current' if pomodoro_length == 5
    when 'break_3'
      'current' if pomodoro_length == 6
    when '4'
      'current' if pomodoro_length == 7
    when 'break_4'
      'current' if pomodoro_length == 8
    else
      ''
    end
  end
end

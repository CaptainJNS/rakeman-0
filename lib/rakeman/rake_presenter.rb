# frozen_string_literal: true

module RakePresenter
  RAKE_REGEX = /rake ([\w:]+) #/
  DESC_REGEX = /# ([\w\W]+)/

  def get_tasks_list
    tasks_list = `rake -T`.split("\n").map { |task| task.squeeze(' ') }

    parse_to_hash(tasks_list)
  end

  private

  def parse_to_hash(tasks_list)
    result = []
    tasks_list.each do |task|
      result << {
        rake: RAKE_REGEX.match(task)[1],
        desc: DESC_REGEX.match(task)[1],
        done: false
      }
    end
    result
  end
end

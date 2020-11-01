# frozen_string_literal: true

module RakeUpdater
  def update_list(old_tasks:, new_tasks:)
    generate_data(old_tasks, new_tasks)
  end
  
  def mark_as_done(task_name:, task_list:)
    task_to_update = task_list.detect { |task| task[:rake] == task_name }
    task_to_update[:done] = true if task_to_update
    task_list
  end

  def mark_as_undone(task_name:, task_list:)
    task_to_update = task_list.detect { |task| task[:rake] == task_name }
    task_to_update[:done] = false if task_to_update
    task_list
  end

  private

  def generate_data(old_tasks, new_tasks)
    result = []
    new_tasks.each do |new_task|
      overwrited_task = old_tasks.detect { |old_task| old_task[:rake] == new_task[:rake] }
      next result << overwrited_task.merge(desc: new_task[:desc]) if overwrited_task

      result << new_task
    end

    result
  end
end

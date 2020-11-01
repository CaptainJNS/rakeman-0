RSpec.describe Rakeman::Manager do
  let(:subject) { described_class.new }

  describe '#update_list' do
    let(:old_tasks) do
      [
        {
          rake: 'namespace:old_task1',
          desc: 'old description',
          done: true
        },
        {
          rake: 'namespace:old_task2',
          desc: 'old description',
          done: true
        },
        {
          rake: 'old_task3',
          desc: 'old description',
          done: false
        }
      ]
    end
    let(:new_tasks) do
      [
        {
          rake: 'namespace:old_task1',
          desc: 'new description',
          done: false
        },
        {
          rake: 'namespace:new_task2',
          desc: 'new description',
          done: false
        },
        {
          rake: 'old_task3',
          desc: 'new description',
          done: false
        },
        {
          rake: 'new_task',
          desc: 'new description',
          done: false
        }
      ]
    end
    let(:expected_tasks) do
      [
        {
          rake: 'namespace:old_task1',
          desc: 'new description',
          done: true
        },
        {
          rake: 'old_task3',
          desc: 'new description',
          done: false
        },
        {
          rake: 'namespace:new_task2',
          desc: 'new description',
          done: false
        },
        {
          rake: 'new_task',
          desc: 'new description',
          done: false
        }
      ]
    end

    it 'return updated array of rake tasks' do
      expect(subject.update_list(old_tasks: old_tasks, new_tasks: new_tasks))
        .to match_array(expected_tasks)
    end
  end

  describe '#mark_as_done' do
    let(:task_name) { 'task1' }
    let(:tasks) do
      [
        {
          rake: task_name,
          desc: 'description',
          done: false
        },
        {
          rake: 'task2',
          desc: 'description',
          done: false
        }
      ]
    end
    let(:expected_tasks) do
      [
        {
          rake: task_name,
          desc: 'description',
          done: true
        },
        {
          rake: 'task2',
          desc: 'description',
          done: false
        }
      ]
    end

    it 'return updated array of rake tasks' do
      expect(subject.mark_as_done(task_name: task_name, task_list: tasks))
        .to match_array(expected_tasks)
    end
  end

  describe '#mark_as_undone' do
    let(:task_name) { 'task1' }
    let(:tasks) do
      [
        {
          rake: task_name,
          desc: 'description',
          done: true
        },
        {
          rake: 'task2',
          desc: 'description',
          done: true
        }
      ]
    end
    let(:expected_tasks) do
      [
        {
          rake: task_name,
          desc: 'description',
          done: false
        },
        {
          rake: 'task2',
          desc: 'description',
          done: true
        }
      ]
    end

    it 'return updated array of rake tasks' do
      expect(subject.mark_as_undone(task_name: task_name, task_list: tasks))
        .to match_array(expected_tasks)
    end
  end
end

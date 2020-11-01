RSpec.describe Rakeman::Manager do
  let(:subject) { described_class.new }

  describe '#get_tasks_list' do
    let(:unparsed_list) do
      "rake task1            # Task 1 Description
        rake task2            # Task 2 Description
        rake task3          # Task 3 Description"
    end
    let(:expected_list) do
      [
        {
          rake: 'task1',
          desc: 'Task 1 Description',
          done: false
        },
        {
          rake: 'task2',
          desc: 'Task 2 Description',
          done: false
        },
        {
          rake: 'task3',
          desc: 'Task 3 Description',
          done: false
        }
      ]
    end

    before do
      allow(subject).to receive(:`).with('rake -T').and_return(unparsed_list)
    end

    it 'gets list of all rake tasks' do
      subject.get_tasks_list
      expect(subject).to have_received(:`).with('rake -T') 
    end

    it 'parses task list to array of hashes' do
      expect(subject.get_tasks_list)
        .to match_array(expected_list)
    end
  end
end

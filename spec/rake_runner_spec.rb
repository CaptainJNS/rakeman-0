RSpec.describe Rakeman::Manager do
  let(:subject) { described_class.new }

  describe '#execute' do
    let(:task_name) { 'namespace:subnamespace:task' }
    let(:task_list) do
      [
        {
          rake: task_name,
          desc: 'description',
          done: false
        }
      ]
    end

    context 'when task name is valid' do
      let(:expected_list) do
        [
          {
            rake: task_name,
            desc: 'description',
            done: true
          }
        ]
      end

      before do
        allow(subject).to receive(:`).with("rake #{task_name}").and_return(true)
      end

      it 'executes rake task' do
        subject.execute(task_name: task_name, task_list: task_list)
        expect(subject).to have_received(:`).with("rake #{task_name}") 
      end

      it 'updates task to done' do
        expect(subject.execute(task_name: task_name, task_list: task_list))
          .to match_array(expected_list)
      end
    end

    context 'when task name is invalid' do
      let(:danger_command_injection) { '&& rm -rf *' }

      before do
        allow(subject).to receive(:`)
      end

      it 'does not executes rake task' do
        subject.execute(task_name: danger_command_injection, task_list: task_list)
        expect(subject).not_to have_received(:`)
      end

      it 'returns nil' do
        expect(subject.execute(task_name: danger_command_injection, task_list: task_list)).to be_nil
      end
    end
  end
end

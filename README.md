# Rakeman

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rakeman'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rakeman

## Usage

Create an instance of `Rakeman::Manager` and call
 - `get_tasks_list` to fetch all tasks in your project. The output data will be:
   ```ruby
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
 - `execute(task_name:, task_list:)` to execute your task. It returns array of tasks with your task marked as done
 - `update_list` to fetch all new tasks and remove old task that does not exist anymore. It saves done states of your tasks and updates their description
 - `mark_as_done(task_name:, task_list:)` to mark your task as done
 - `mark_as_undone(task_name:, task_list:)` to mark your task as undone

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CaptainJNS/rakeman. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/CaptainJNS/rakeman/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rakeman project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/CaptainJNS/rakeman/blob/master/CODE_OF_CONDUCT.md).

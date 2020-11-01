# frozen_string_literal: true

require 'rakeman/version'
require_relative 'rakeman/rake_presenter'
require_relative 'rakeman/rake_updater'
require_relative 'rakeman/rake_runner'

module Rakeman
  class Manager
    TASK_REGEX = /^[\w:]+$/

    include RakePresenter
    include RakeUpdater
    include RakeRunner

    def execute(task_name:, task_list:)
      return unless TASK_REGEX.match?(task_name)

      run(task_name)
      mark_as_done(task_name: task_name, task_list: task_list)
    end
  end
end

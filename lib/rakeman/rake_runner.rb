# frozen_string_literal: true

module RakeRunner
  private

  def run(task)
    `rake #{task}`
  end
end

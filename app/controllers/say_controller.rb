class SayController < ApplicationController
  def hello
    @time = Time.now
  end

  def goodby
    @files = Dir.glob('*')
  end
end

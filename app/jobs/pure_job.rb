class PureJob < ApplicationJob
  queue_as :default

  def perform(id)
    @id = id
    record_first
    DoSomething.execute(self.class)
    record_current
  end
end

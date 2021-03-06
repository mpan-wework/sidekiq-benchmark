class PureWorker
  include Sidekiq::Worker
  include TimeElapsable

  def perform(id)
    @id = id
    record_first
    DoSomething.execute(self.class)
    record_current
  end
end

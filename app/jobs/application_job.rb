class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError

  private

  def record_first
    return if @id != 0

    start_time = DateTime.now.strftime('%Q')
    Rails.cache.write("#{self.class}-#{@id}", start_time)
  end

  def record_current
    end_time = DateTime.now.strftime('%Q')
    Rails.cache.write(self.class, "#{@id}, #{end_time}")
  end
end

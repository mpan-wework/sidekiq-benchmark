require 'rails_helper'
require_relative './benchmark_job_spec'

RSpec.describe PureJob, type: :job do
  it_behaves_like 'Benchmark Job'
end

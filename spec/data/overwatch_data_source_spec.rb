require "overwatch_data_source"

RSpec.describe OverwatchDataSource do
  it_behaves_like_overwatch_data_source(OverwatchDataSource.new)
end

require "entities/hero"

class FakeOverwatchDataSource
  def heroes
    [first_hero].each
  end

  def abilities
    [first_ability].each
  end
end

RSpec.describe FakeOverwatchDataSource do
  it_behaves_like_overwatch_data_source(FakeOverwatchDataSource.new)
end

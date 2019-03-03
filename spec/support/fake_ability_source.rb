require "entities/ability"

class FakeAbilitySource
  def each(&block)
    [first_ability].each(&block)
  end
end

RSpec.describe FakeAbilitySource do
  it_behaves_like_ability_source(FakeAbilitySource.new)
end

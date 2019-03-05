require "memory_repo"
require "get_ability_list"

RSpec.describe GetAbilityList do
  let(:ability_repo) { MemoryRepo.new }
  let(:get_ability_list) { GetAbilityList.new(ability_repo: ability_repo) }

  before { ability_repo.replace_all_by([first_ability, second_ability]) }

  it "returns paginated collection of heroes" do
    result = get_ability_list.call(page: 2, per: 1)

    expect(result).to eq Paginated.new(
      collection: [second_ability],
      page: 2,
      per: 1,
      total: 2,
    )
  end
end

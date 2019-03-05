require "get_ability_details"
require "memory_repo"

RSpec.describe GetAbilityDetails do
  let(:ability_repo) { MemoryRepo.new }
  let(:get_ability_details) { GetAbilityDetails.new(ability_repo: ability_repo) }

  before { ability_repo.replace_all_by([first_ability, second_ability]) }

  it "returns paginated collection of abilityes" do
    expect(
      get_ability_details.call(id: second_ability.id).value!
    ).to eq second_ability
  end
end


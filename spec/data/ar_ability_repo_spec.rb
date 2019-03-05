require "rails_helper"
require "ar_ability_repo"

RSpec.describe ARAbilityRepo do
  it_behaves_like_ability_repo(ARAbilityRepo.new)
end

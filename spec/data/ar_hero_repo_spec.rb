require "rails_helper"
require "ar_hero_repo"

RSpec.describe ARHeroRepo do
  it_behaves_like_hero_repo(ARHeroRepo.new)
end

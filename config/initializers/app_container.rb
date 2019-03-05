class AppContainer
  extend Dry::Container::Mixin

  # data
  register(:hero_repo) { ARHeroRepo.new }
  register(:ability_repo) { ARAbilityRepo.new }
  register(:data_source) { OverwatchDataSource.new }

  # use_cases
  register(:sync_data) { SynchronizeData.new }
  register(:get_ability_details) { GetAbilityDetails.new }
  register(:get_ability_list) { GetAbilityList.new }
  register(:get_hero_details) { GetHeroDetails.new }
  register(:get_hero_list) { GetHeroList.new }
end

Import = Dry::AutoInject(AppContainer)

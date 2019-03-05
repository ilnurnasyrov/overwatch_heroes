task sync_data: :environment do
  AppContainer[:sync_data].call
end

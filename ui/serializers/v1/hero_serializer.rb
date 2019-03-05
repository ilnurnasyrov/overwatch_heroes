module V1
  class HeroSerializer
    include FastJsonapi::ObjectSerializer

    set_type :hero

    attributes :id, :armour, :health, :name, :real_name, :shield
  end
end

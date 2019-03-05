module V1
  class AbilitySerializer
    include FastJsonapi::ObjectSerializer

    set_type :ability

    attributes :id, :name, :description, :is_ultimate, :hero_id
  end
end

require "entities/hero"

class MemoryRepo
  def initialize
    @collection = []
  end

  def replace_all_by(collection)
    @collection = collection.sort_by(&:id)
  end

  def find_by_id(id)
    collection.detect { |item| item.id == id }
  end

  def paginate(page: 1, per: 50)
    left = (page - 1) * per
    right = left + per - 1

    {
      data: collection[left..right],
      total: collection.count,
      page: page,
      per: per,
    }
  end

  private

  attr_reader :collection
end

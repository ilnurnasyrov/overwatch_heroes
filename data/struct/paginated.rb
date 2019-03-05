require "utils/app_struct"

class Paginated < AppStruct
  attribute :per, Types::Strict::Integer.constrained(gt: 0)
  attribute :page, Types::Strict::Integer.constrained(gt: 0)
  attribute :total, Types::Strict::Integer.constrained(gteq: 0)
  attribute :collection, Types::Strict::Array.of(Types::Any)

  def next_page
    page + 1 if page < last_page
  end

  def prev_page
    page - 1 if page > 1
  end

  def last_page
    (total / per.to_f).ceil
  end
end

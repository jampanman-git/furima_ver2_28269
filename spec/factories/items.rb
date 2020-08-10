FactoryBot.define do
  factory :item do
    image {""}
    name {"あああ"}
    description{"あああ"}
    price{"300"}
    user 
    category_id{2}
    status_id{2}
    area_id{2}
    deli_day_id{2}
    deli_fee_id{2}
  end
end

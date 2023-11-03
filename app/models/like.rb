class Like < ApplicationRecord
    validates :liker_id, :home_id, presence: true
    validates_uniqueness_of :liker_id, scope: :home_id

    belongs_to :liker,
    primary_key: :id,
    foreign_key: :liker_id,
    class_name: :User

    belongs_to :home,
    primary_key: :id,
    foreign_key: :home_id,
    class_name: :Home
    
end

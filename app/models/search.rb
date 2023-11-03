class Search < ApplicationRecord
    validates :searcher_id, presence: true

    belongs_to :searcher,
    primary_key: :id,
    foreign_key: :searcher_id,
    class_name: :User

end

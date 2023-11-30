class Home < ApplicationRecord
    validates :address, :city, :state, :zipcode, :price, :bedrooms, :bathrooms, :square_feet, :lot_size, :built_date, :property_type, :seller_id, presence: true

    belongs_to :seller,
    primary_key: :id,
    foreign_key: :seller_id,
    class_name: :User

    has_many_attached :photos

end

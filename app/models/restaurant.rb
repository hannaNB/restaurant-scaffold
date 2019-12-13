class Restaurant < ApplicationRecord
    validates :stars, inclusion: { in: [1, 2, 3], allow_nil: false}
    validates :name, uniqueness: true, presence: true
    validates :address, presence: true
    # dependent : supprime toutes les reviews attacher 
    # a un resto lorsqu'il est supprimmer
    has_many :reviews, dependent: :destroy
end

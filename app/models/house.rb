class House < ApplicationRecord
    has_many :students, dependent: :destroy
    has_many :teachers, dependent: :destroy

    validates :name, :points, presence: true
    validates :points, numericality: { only_integer: true }
end
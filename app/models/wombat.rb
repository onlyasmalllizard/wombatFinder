class Wombat < ApplicationRecord
    validates :url, presence: true,
                    uniqueness: true
end

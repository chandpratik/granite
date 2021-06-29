class Task < ApplicationRecord
  alidates :title, presence: true, length: { maximum: 50 }
end
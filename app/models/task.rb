class Task < ApplicationRecord
    validates :task_name, presence: true, length: { in: 1..255 }
    belongs_to :client
end

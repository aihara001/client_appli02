class Client < ApplicationRecord
    validates :client_name, presence: true, length: { in: 1..255 }
    validates :client_content, length: { in: 0..255 }
    has_many :tasks, dependent: :destroy
    
    scope :with_task, -> { joins(:tasks) }
    scope :search_task_id, ->(client_id) { where(id: client_id) }

end

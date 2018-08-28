class Task < ApplicationRecord
    validates :task_name, presence: true, length: { in: 1..255 }
    validates :task_day, presence: true
    validates :task_payment_year, presence: true, numericality: { only_integer: true, greater_than: 2017, less_than: 2020 }
    validates :task_payment_month, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 13 }
    validates :task_payment, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 999999999 }
    validates :task_content, length: { in: 0..255 }
    belongs_to :client
end

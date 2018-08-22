class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.date :task_day
      t.integer :task_payment_year
      t.integer :task_payment_month
      t.integer :task_payment
      t.string :task_content
      t.references :client
      t.timestamps
    end
  end
end

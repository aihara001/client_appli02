class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string "client_name"
      t.string "client_content"
      t.integer "client_payment"
    end
  end
end

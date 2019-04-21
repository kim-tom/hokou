class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table(:accounts) do |t|
      t.column :salt, :string, limit: 40
      t.column :hashed, :string, limit: 40
      t.column :algo, :string, limit: 5
    end
    create_table :hokous do |t|
      t.column :grade, :int
      t.column :dptmnt, :string, limit: 4
      t.column :date_rest, :date
      t.column :koma_rest, :string, limit: 40
      t.column :date_ex, :date
      t.column :koma_ex, :string, limit: 40
      t.column :subject, :string, limit: 40
      t.column :teacher, :string, limit: 40
      t.column :bikou, :string, limit: 140
    end
  end
end

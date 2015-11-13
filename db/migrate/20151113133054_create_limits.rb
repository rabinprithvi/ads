class CreateLimits < ActiveRecord::Migration
  def change
    create_table :limits do |t|
      t.integer :leads
      t.integer :sms
      t.integer :email
      t.integer :post
      t.references :plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

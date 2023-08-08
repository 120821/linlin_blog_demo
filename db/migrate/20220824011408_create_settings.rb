class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.string :value
      t.string :comment
      t.string :default

      t.timestamps null: false
    end
    Setting.create name: 'ENABLE_MOBILE_EMAIL', value: 'no', default: 'no', comment:  ''
  end
end

class InitialSchema < ActiveRecord::Migration
  def change

  	create_table :events do |t|
      t.string :title
  		t.text :body
  		t.timestamps
  end

  	create_table :categories do |t|
  		t.string :name
  end
  
 	 create_table :comments do |t|
  		t.text :body
  		t.timestamps
  end

  	add_reference :comments, :event, index:true
  	add_reference :comments, :user, index:true
  	add_reference :events, :user, index:true
  	add_reference :events, :category, index:true

  end
end

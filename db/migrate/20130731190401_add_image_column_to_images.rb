class AddImageColumnToImages < ActiveRecord::Migration
  def change
  	add_attachment :images, :image
  end
end

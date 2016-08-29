class AddPostImageColumnToPosts < ActiveRecord::Migration[5.0]
  def change
    add_attachment :posts, :post_image
  end
end

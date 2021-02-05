class SearchItemsService
  def self.search(search)
    if search != ""
      Item.where('product_name LIKE(?) OR product_description LIKE(?)', "%#{search}%", "%#{search}%")
    end
  end
end
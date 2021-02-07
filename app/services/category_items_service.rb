class CategoryItemsService
  def self.category(id)
    if id != ""
      Item.where('category_id = ?',id)
    end
  end
end
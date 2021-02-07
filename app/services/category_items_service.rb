class CategoryItemsService
  def self.category(category)
    if category != ""
      category = Category.find_by(name: category)
      Item.where('category_id = ?',category.id)
    end
  end
end
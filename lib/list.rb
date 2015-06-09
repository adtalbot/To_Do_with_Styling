class List
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    found_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    found_lists.each do |found_list|
      name = found_list.fetch("name")
      id = found_list.fetch("id")
      list.push(List.new(:name => name, :id => id))
    end
    lists
  end
end

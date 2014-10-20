def menu_lists
  list = super

  item = { :type => 'padrino_handler', :title => 'Handlers', :search_title => 'Handler List' }

  at = -1
  list.each_with_index do |item, i|
    if item[:type] == 'file'
      at = i
      break
    end
  end

  list[at, 0] = item

  list
end

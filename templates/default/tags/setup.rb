def param
  tag(:param) if object.type == :method || object.type == :padrino_route || object.type == :padrino_handler
end

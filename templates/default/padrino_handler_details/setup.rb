def init
  sections :header, [:method_signature, T('docstring'), :source]
end

def source
  return if object.source.nil?
  erb(:source)
end

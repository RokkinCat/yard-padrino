def init
  super

  padrino_summaries = [
    :padrino_routes_summary,   [ :padrino_handler_summary ],
    :padrino_handlers_summary, [ :padrino_handler_summary ],
  ]
  padrino_details = [
    :padrino_routes_details_list,   [T('padrino_handler_details')],
    :padrino_handlers_details_list, [T('padrino_handler_details')],
  ]

  sections.place(padrino_summaries).before(:method_summary)
  sections.place(padrino_details).before(:method_details_list)
  sections.delete(:method_details_list)
  sections.delete(:method_details_summary)
  sections.delete(:constant_summary)
  sections.delete(:method_summary)
  sections.delete(:pre_docstring)
end

def padrino_routes
  unless @routes
    @routes = object.children.select { |o| o.is_a?(YARD::Padrino::RouteObject) }.sort
  end

  @routes
end

def padrino_handlers
  unless @handlers
    @handlers =  []
  end

  @handlers
end

def padrino_routes_listing
  unless @routes_listing
    routes = padrino_routes
    methods = {}
    routes.each do |route|
      controller = (route.controller || "").to_s
      methods[controller] ||= []
      methods[controller] << route
    end

    @routes_listing = []
    methods.keys.sort.each do |controller|
      @routes_listing << {
        controller: controller,
        routes:     methods[controller]
      }
    end
  end

  @routes_listing
end

def padrino_handlers_listing
  unless @handlers_listing
    handlers = padrino_handlers
    methods = {}
    handlers.each do |handler|
      controller = (handler.controller || "").to_s
      methods[controller] ||= []
      methods[controller] << handler
    end

    @handlers_listing = []
  end

  @handlers_listing
end

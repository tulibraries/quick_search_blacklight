module QuickSearch
  module Blacklight
    class Engine < ::Rails::Engine
      isolate_namespace QuickSearch::Blacklight
    end
  end
end

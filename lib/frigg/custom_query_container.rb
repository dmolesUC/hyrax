# frozen_string_literal: true
module Frigg
  class CustomQueryContainer < Valkyrie::Persistence::CustomQueryContainer
    def method_missing(method_name, *args, **opts)
      query_service.services.each do |service|
        return service.custom_queries.send(method_name, *args, **opts) if service.custom_queries.respond_to?(method_name)
      end
      super
    end

    def respond_to_missing?(method_name, _include_private = false)
      query_service.services.each do |service|
        return true if service.custom_queries.respond_to?(method_name)
      end
    end
  end
end

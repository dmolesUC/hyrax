# frozen_string_literal: true
module Freyja
  class QueryService
    include Goddess::Query

    ##
    # Constructs a Valkyrie::Persistence::CustomQueryContainer using this
    # query service
    #
    # @return [Valkyrie::Persistence::CustomQueryContainer]
    def custom_queries
      @custom_queries ||= Freyja::CustomQueryContainer.new(query_service: self)
    end
    alias_method :custom_query, :custom_queries
  end
end

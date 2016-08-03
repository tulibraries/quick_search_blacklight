module QuickSearch
  class BlacklightSearcher < QuickSearch::Searcher

    def search
      url = base_url + parameters.to_query
      Rails.logger.info "Blacklight query url: #{url}"
      raw_response = @http.get(url)
      @response = JSON.parse(raw_response.body)
    end

    def results
      if results_list
        results_list
      else
        @results_list = []
        @response['response']['docs'].each do |record|
          result = OpenStruct.new

          result.title = title(record)
          result.link = link(record)
          result.description = description(record)

          @results_list << result
        end
        @results_list
      end
    end

    private

    def base_url
      "#{QuickSearch::Engine::BLACKLIGHT_CONFIG['blacklight_catalog_url']}/catalog.json?"
    end

    def parameters
      {
          'q' => "#{http_request_queries['not_escaped']}",
          'per_page' => @per_page,
          'page' => @offset
      }
    end

    def title(record)
      record['title_tesim'].join('; ')
    end

    def link(record)
      "#{QuickSearch::Engine::BLACKLIGHT_CONFIG['blacklight_catalog_url']}/catalog/#{record['id']}"
    end

    def description(record)
      record['content_summary_tesim'].join('; ')
    end
  end
end
# frozen_string_literal: true

class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token
  
  def response_data(type, obj)
    data = {}
    data[:type] = type
    data[:count] = obj.count
    data[:data] = obj.as_json(only: response_fields(type))
    data
  end

  def response_fields(type)
    response_fields_array = case type
                            when 'catalogs'
                              %i[id name ctype]
                            when 'playlists'
                              %i[id name title]
                            when 'articles'
                              %i[id title short_description long_description status comments_url]
                            when 'comments'
                              %i[url]
                            end
  end
end

# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, 422)
    end
  end
end

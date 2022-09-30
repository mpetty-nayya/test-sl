# frozen_string_literal: true

module HrOpen
  module Contracts
    module Base
      class IdentifierType < Dry::Validation::Contract
        params do
          required(:value).value(:string)
        end
      end
    end
  end

end

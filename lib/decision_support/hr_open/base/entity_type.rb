# frozen_string_literal: true

module HrOpen
  module Contracts
    module Base
      class EntityType < Dry::Validation::Contract
        params do
          required(:id).schema(Base::IdentifierType.schema)
          required(:name).value(:string)
        end
      end
    end
  end

end

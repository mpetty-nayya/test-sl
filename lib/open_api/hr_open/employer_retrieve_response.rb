# frozen_string_literal: true

module HrOpen
  module Contracts
    class EmployerRetrieveResponse < Dry::Validation::Contract
      params do
        required(:id).schema(Base::IdentifierType.schema)
        required(:name).value(:string)
        required(:taxId).schema(Base::IdentifierType.schema)
      end
    end
  end
end

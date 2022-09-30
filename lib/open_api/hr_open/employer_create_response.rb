# frozen_string_literal: true

module HrOpen
  module Contracts
    class EmployerCreateResponse < Dry::Validation::Contract
      schema do
        required(:id).schema(Base::IdentifierType.schema)
        required(:name).value(:string)
        required(:taxId).schema(Base::IdentifierType.schema)
      end
    end
  end
end


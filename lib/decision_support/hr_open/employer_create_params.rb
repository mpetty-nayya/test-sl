# frozen_string_literal: true

module HrOpen
  module Contracts
    class EmployerCreateParams < Dry::Validation::Contract
      params do
        required(:employerOrganization).schema do
          required(:id).schema(Base::IdentifierType.schema)
          required(:name).value(:string)
          required(:taxId).schema(Base::IdentifierType.schema)
        end
      end
    end
  end
end

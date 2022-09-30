# example of generated dry contract
# this was not generated

module DecisionSupport
  module HrOpen
    class EmployerCreateResponse < Dry::Validation::Contract
        params do
                required(:employerOrganization).schema do
                    required(:id).schema do
                      required(:value).value(:string)
                    end
                    required(:name).filled(:string)
                    optional(:id).schema do
                        required(:value).value(:string)
                    end
                  end
            end
        end
    end
end
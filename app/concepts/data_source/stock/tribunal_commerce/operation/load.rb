module DataSource
  module Stock
    module TribunalCommerce
      module Operation
        class Load < Trailblazer::Operation
          step Nested(RetrieveLastStock)
          step ->(ctx, stock:, **) { stock.newer? }
          step ->(ctx, stock:, **) { stock.save }
          step Nested(PrepareImport)
          step Import
        end
      end
    end
  end
end

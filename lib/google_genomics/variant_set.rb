module GoogleGenomics
  class VariantSet
   
      def self.all
        res = GoogleGenomics::Auth.client.execute( 
          :api_method => GoogleGenomics::Auth.api.variantsets.search,
          :body_object => {'datasetIds' => [ENV['GOOGLE_GENOMICS_DATASET_ID']]}
        )
        Hashie::Mash.new(JSON.parse(res.body)).variantSets
      end

      def self.find(variantSetId)
        res = GoogleGenomics::Auth.client.execute(
          :api_method=> GoogleGenomics::Auth.api.variantsets.get, 
          :parameters=> {"variantSetId" => variantSetId }
        )
        Hashie::Mash.new(JSON.parse(res.body))
      end

  end
end

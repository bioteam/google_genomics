module GoogleGenomics
  class ReadGroupSet
   
      def self.all
        res = GoogleGenomics::Auth.client.execute( 
          :api_method => GoogleGenomics::Auth.api.readgroupsets.search,
          :body_object => {'datasetIds' => [ENV['GOOGLE_GENOMICS_DATASET_ID']], 'pageSize' => 5}      )
        Hashie::Mash.new(JSON.parse(res.body)).readGroupSets
      end

      def self.find(readGroupSetId)
        res = GoogleGenomics::Auth.client.execute(
          :api_method=> GoogleGenomics::Auth.api.readgroupsets.get, 
          :parameters=> {"readGroupSetId" => readGroupSetId }
        )
        Hashie::Mash.new(JSON.parse(res.body))
      end

  end
end

class CallSet
 
    def self.all
      res = GoogleGenomics::Auth.client.execute( 
        :api_method => GoogleGenomics::Auth.api.callsets.search,
        :body_object => {'variantSetIds' => [ENV['GOOGLE_GENOMICS_VARIANTSET_ID']], 'pageSize' => 10}
      )
      Hashie::Mash.new(JSON.parse(res.body)).callSets
    end

    def self.find(callSetId)
      res = GoogleGenomics::Auth.client.execute(
        :api_method=> GoogleGenomics::Auth.api.callsets.get, 
        :parameters=> {"callSetId" => callSetId }
      )
      Hashie::Mash.new(JSON.parse(res.body))
    end

end
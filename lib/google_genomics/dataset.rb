class Dataset
 
    def self.all
      res = GoogleGenomics::Auth.client.execute( 
        GoogleGenomics::Auth.api.datasets.list,
        :parameters=> {"projectNumber"=> ENV['GOOGLE_GENOMICS_PROJECT_NUMBER'] }
      )
      Hashie::Mash.new(JSON.parse(res.body)).datasets
    end

    def self.find(dataset_id)
      res = GoogleGenomics::Auth.client.execute(
        :api_method=> GoogleGenomics::Auth.api.datasets.get, 
        :parameters=> {"datasetId"=> dataset_id }
      )
      Hashie::Mash.new(JSON.parse(res.body))
    end

end
module GoogleGenomics
  class Variant < ActiveRecord::Base
   
      def self.all
        res = GoogleGenomics::Auth.client.execute( 
          :api_method => GoogleGenomics::Auth.api.variants.search,
          :body_object => {'variantSetIds' => [ENV['GOOGLE_GENOMICS_VARIANTSET_ID']],'callSetIds' => ['10473108253681171589-0'], 'referenceName' => 1, 'maxCalls' => 1}
        )
        Hashie::Mash.new(JSON.parse(res.body)).variants
      end

      def self.find(variantId)
        res = GoogleGenomics::Auth.client.execute(
          :api_method=> GoogleGenomics::Auth.api.variants.get, 
          :parameters=> {"variantId" => variantId }
        )
        Hashie::Mash.new(JSON.parse(res.body))
      end

  end
end

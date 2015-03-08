$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "google/api_client"
require "active_support"
require "hashie"

module GoogleGenomics

  autoload  :VERSION,       'google_genomics/version.rb'
  autoload  :Config,        'google_genomics/config.rb'
  autoload  :Auth,          'google_genomics/auth.rb'
  autoload  :Client,        'google_genomics/client.rb'
  autoload  :Dataset,       'google_genomics/dataset.rb'
  autoload  :CallSet,       'google_genomics/call_set.rb'
  autoload  :Read,          'google_genomics/read.rb'
  autoload  :ReadGroupSet,  'google_genomics/read_group_set.rb'
  autoload  :ReadGroupSetCoverageBuckets,'google_genomics/read_group_set_coverage_buckets.rb'
  autoload  :Reference,     'google_genomics/reference.rb'
  autoload  :ReferenceBases,'google_genomics/reference_bases.rb'
  autoload  :ReferenceSet,  'google_genomics/reference_set.rb'
  autoload  :Variant,       'google_genomics/variant.rb'
  autoload  :VariantSet,    'google_genomics/variant_set.rb'
  autoload  :Jobs,          'google_genomics/job.rb'

  if defined?(::Rails::Railtie)
    autoload  :Rails,   'google_genomics/engine.rb' if ::Rails.version >= '3.1'
    require File.join(File.dirname(__FILE__), *%w[google_genomics railtie]) if ::Rails.version.to_s >= '3.1'
  end

end

class Prompt < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :text, type: :text, analyzer: 'english'
    end
  end

  def self.search(query)
    self.__elasticsearch__.search(query)
  end

end

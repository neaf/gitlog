class Commit
  include Mongoid::Document

  field :author, type: String
  field :message, type: String
  field :timestamp, type: Time

  embedded_in :log_item, inverse_of: :commits

  def self.from_payload(payload)
    commit = self.new.tap do |c|
      c.author = payload["author"]["name"]
      c.message = payload["message"]
      c.timestamp = DateTime.parse(payload["timestamp"])
    end
  end
end

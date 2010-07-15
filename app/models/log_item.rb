class LogItem
  include Mongoid::Document
  include Mongoid::Timestamps

  field :repository, type: String

  embeds_many :commits

  def self.create_from_payload(payload)
    item = self.new.tap do |i|
      i.repository = payload["repository"]["name"]
      payload["commits"].each do |c|
        i.commits << Commit.from_payload(c)
      end
      i.save
    end
  end
end

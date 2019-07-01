module YouTube
  class Video
    attr_reader :thumbnail

    def initialize(data = {})
      @thumbnail = data[:items].first[:snippet][:thumbnails][:high][:url]
    end

    def self.by_id(id)
      binding.pry
      new(YoutubeService.new.video_info(id))
    end
  end
end

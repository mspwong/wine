module WinesHelper

  def format_tags(tags)
    first = true
    tags.collect do |t|
        if first
            first = false
            t.name
        else
            " | " + t.name
        end
    end
  end

end

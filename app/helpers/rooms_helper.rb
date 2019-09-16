module RoomsHelper
    def render_joke_errors(room)
        if !room.errors.empty?
            room.errors.full_messages.each do |msg|
                li_tag(msg)
            end
        end
    end
end

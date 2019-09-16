module JokesHelper
    def render_joke_errors(joke)
        if !joke.errors.empty?
            joke.errors.full_messages.each do |msg|
                li_tag(msg)
            end
        end
    end
end

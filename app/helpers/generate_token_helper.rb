module GenerateTokenHelper
    def generate_token
        char = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
        token = (0...50).map { char[rand(char.length)] }.join
    end    
end

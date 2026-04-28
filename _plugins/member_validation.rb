module Jekyll
  module MemberValidation
    TEAM_ROLES = %w[
      pi
      postdoc
      phd
      msc
      masc
      meng
      ra
      undergrad
    ].freeze

    ROLE_SUGGESTIONS = {
      "postdoctoral fellow" => "postdoc",
      "postdoctoral researcher" => "postdoc",
      "postdoctoral scholar" => "postdoc",
      "postdoc fellow" => "postdoc",
      "phd student" => "phd",
      "doctoral student" => "phd",
      "master's student" => "msc",
      "masters student" => "msc",
      "research assistant" => "ra",
      "undergraduate student" => "undergrad",
    }.freeze

    def self.validate!(site)
      members = site.collections.fetch("members", nil)
      return unless members

      members.docs.each do |member|
        role = member.data.fetch("role", "").to_s.strip
        next if TEAM_ROLES.include?(role)

        message = if role.empty?
          "Missing role in #{member.relative_path}."
        else
          "Invalid role #{role.inspect} in #{member.relative_path}."
        end

        suggestion = ROLE_SUGGESTIONS[role.downcase]
        if suggestion
          message += " Did you mean #{suggestion.inspect}?"
        end

        message += " Use one of: #{TEAM_ROLES.join(', ')}."
        raise Jekyll::Errors::FatalException, message
      end
    end
  end
end

Jekyll::Hooks.register(:site, :post_read) do |site|
  Jekyll::MemberValidation.validate!(site)
end

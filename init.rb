Redmine::Plugin.register :hide_new_issue_link do
  name 'Redmine Hide Link from Menu Plugin'
  author 'Jesper Thomschutz'
  description 'By default, this plugin will hide "New Issue" from the project menu for a specific project. Can be esily modified to suit your needs by editing "init.rb"'
  version '0.0.1'
  url 'http://github.com/jesper'
  author_url 'http://www.jespersaur.com'
end

module Redmine
  module MenuManager
    module MenuHelper
      alias_method :old_allowed_node?, :allowed_node?
      def allowed_node?(node, user, project)
         if project.to_s == 'PROJECT_NAME_GOES_HERE' and node.name == :new_issue
           return false
          end
          old_allowed_node?(node, user, project)
      end
    end
  end
end

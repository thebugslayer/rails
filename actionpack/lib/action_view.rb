#--
# Copyright (c) 2004-2009 David Heinemeier Hansson
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

activesupport_path = File.expand_path('../../../activesupport/lib', __FILE__)
$:.unshift(activesupport_path) if File.directory?(activesupport_path) && !$:.include?(activesupport_path)
require 'active_support/ruby/shim'
require 'active_support/core_ext/class/attribute_accessors'

require 'action_pack'

module ActionView
  extend ActiveSupport::Autoload

  autoload :Base
  autoload :Context
  autoload :Template
  autoload :Helpers
  autoload :SafeBuffer


  autoload_under "render" do
    autoload :Partials
    autoload :Rendering
  end

  autoload :MissingTemplate,   'action_view/base'
  autoload :Resolver,          'action_view/template/resolver'
  autoload :PathResolver,      'action_view/template/resolver'
  autoload :PathSet,           'action_view/paths'
  autoload :FileSystemResolverWithFallback, 'action_view/template/resolver'

  autoload :TemplateError,     'action_view/template/error'
  autoload :TemplateHandler,   'action_view/template'
  autoload :TemplateHandlers,  'action_view/template'
end

require 'action_view/erb/util'

I18n.load_path << "#{File.dirname(__FILE__)}/action_view/locale/en.yml"

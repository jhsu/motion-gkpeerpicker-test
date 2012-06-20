# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

require "bundler/setup"
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'buddy'
  app.frameworks += %w(GameKit)
  app.provisioning_profile = '/Users/jshsu/Downloads/StickyHead_Testitos.mobileprovision'

  app.pods do
    # dependency 'JSONKit'
    dependency 'CocoaAsyncSocket'
  end
end

{<img src="https://travis-ci.org/halfdan/piwik-ruby-tracking.png?branch=master" alt="Build Status" />}[https://travis-ci.org/halfdan/piwik-ruby-tracking]

= PiwikAnalytics

<b>Note:</b> This Gem has undergone a major rewrite in 1.x compared to 0.9.x.

The piwik_analytics gem provides an easy way to include Piwik into your application.
By default it will output the synchronous piwik tracking code for every page
(given that it is configured correctly).

== Installation

Add `piwik_analytics` to Gemfile:

    gem 'piwik_analytics', '~> 2.0.0'

Run the generator:

    rails g piwik_analytics:install

This will install a piwik.yml configuration file into the `config` directory
of your application.


== Configuration

Open up `config/piwik.yml` and edit the settings. Each setting is described in
the config file itself.

== Usage

Inside your `application.html.erb` (or haml, slim) simply add

    <%= piwik_tracking_tag %>

Enjoy :)


= License
Copyright(c) 2010-2017 Fabian Becker, released under MIT license.

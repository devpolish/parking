# frozen_string_literal: true

require 'json'

def fixture_file_path(filename)
  File.join(File.expand_path('../fixtures', __dir__), filename)
end

def load_fixture_path(filename)
  File.read(fixture_file_path(filename).to_json)
end
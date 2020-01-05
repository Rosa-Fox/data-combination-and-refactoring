# frozen_string_literal: true

def capture
  $stdout = StringIO.new
  yield
  $stdout.string
ensure
  $stdout = STDOUT
end

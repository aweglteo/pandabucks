class ShowEnv
  def call(env)
    [ 200,
      { 'Content-Type' => 'text/html' },
      ["<html><body><h1>pandabucks web server</h1></body></html>"]
    ]
  end
end

run ShowEnv.new
# should be in ANSI due to 'undefined method' error while being in UTF-8 w/ BOM
$stdout.sync = true

use Rack::Static,
#  :urls => ["/css", "/js", "/fonts", "/images"],
  :root => "."

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'private, no-cache, max-age=0'
    },
    File.open('index.html', File::RDONLY)
  ]
}
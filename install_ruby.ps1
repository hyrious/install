$url = 'https://rubyinstaller.org/downloads/'

''
"Fetching $url"

$links = (wget $url).Links | Where-Object { $_.innerText -like 'Ruby * (x64)' }

$ret = $Host.UI.PromptForChoice(
  'Continue?',
  "Download $($links[0].innerText) ?",
  @('&Yes','&No'),
  0
)

if ($ret -ne 0) { return }

$link = $links[0].href

''
"Fetching $(Split-Path $link -leaf)"

$exe = '.\rubyinstaller.exe'

if (-not (Test-Path $exe)) {
  wget $link -o $exe
}

''
"Executing $exe"

& $exe

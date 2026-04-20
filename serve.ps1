$port = 8090
$root = "c:\Users\gabriel_coimbra\Desktop\WT Private Test\select2"

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:${port}/")
$listener.Start()
Write-Host "Serving HTTP on http://localhost:${port}"

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $requestPath = $context.Request.Url.LocalPath
    
    if ($requestPath -eq "/") {
        $requestPath = "/index.html"
    }
    
    $filePath = Join-Path $root $requestPath
    
    if (Test-Path $filePath) {
        $content = [System.IO.File]::ReadAllBytes($filePath)
        $ext = [System.IO.Path]::GetExtension($filePath)
        
        $contentType = switch ($ext) {
            ".html" { "text/html; charset=utf-8" }
            ".css"  { "text/css" }
            ".js"   { "application/javascript" }
            ".json" { "application/json" }
            ".png"  { "image/png" }
            ".jpg"  { "image/jpeg" }
            ".svg"  { "image/svg+xml" }
            default { "application/octet-stream" }
        }
        
        $context.Response.ContentType = $contentType
        $context.Response.ContentLength64 = $content.Length
        $context.Response.OutputStream.Write($content, 0, $content.Length)
    }
    else {
        $context.Response.StatusCode = 404
        $bytes = [System.Text.Encoding]::UTF8.GetBytes("Not Found")
        $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    }
    
    $context.Response.Close()
}

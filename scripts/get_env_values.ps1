# Load the .env file and set environment variables
Get-Content ".\scripts\.env" | ForEach-Object {
    $name, $value = $_ -split '=', 2
    $name = $name.Trim()
    $value = $value.Trim()
    Set-Content -Path "env:\$name" -Value $value
}

# Access variables from environment
$server = $env:server
$database = $env:database
$user = $env:user
$password = $env:password

Write-Host "`nLoaded Environment Variables:" -ForegroundColor Cyan
Write-Host "server: $server"
Write-Host "database: $database"
Write-Host "user: $user"
Write-Host "password: $password"
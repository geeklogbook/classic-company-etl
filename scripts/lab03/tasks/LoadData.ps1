# Add the MySQL .NET Connector if not already loaded
# Add-Type -Path "C:\Program Files (x86)\MySQL\MySQL Connector NET 9.1\MySql.Data.dll"

$server = "localhost"
$database = "base_negocio"
$user = "root"

$sqlFilePath = "C:\Users\h\Documents\geeklogbook\data-engineer-playground\queries\lab01\end\LoadData.sql" 

$connStr = "server=$server;user=$user;database=$database;password=$password;"

$conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connStr)

try {
    $conn.Open()
    Write-Host "Connection to MySQL database successful."

    $scriptContent = Get-Content -Path $sqlFilePath -Raw

    $cmd = $conn.CreateCommand()
    $cmd.CommandText = $scriptContent

    $cmd.ExecuteNonQuery()

    Write-Host "SQL script executed successfully." -ForegroundColor Green
} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    $conn.Close()
    Write-Host "Connection closed."
}
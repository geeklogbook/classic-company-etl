# You need to install: https://dev.mysql.com/downloads/file/?id=534712
#Add-Type -Path "C:\Program Files (x86)\MySQL\MySQL Connector NET 9.1\MySql.Data.dll"

$server = "localhost"
$database = "base_negocio"
$user = "root"

$query = "SELECT * FROM cargo"


$connStr = "server=$server;user=$user;database=$database;password=$password;"

$conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connStr)

try {
    $conn.Open()
    Write-Host "Connection to MySQL database successful."

    $cmd = $conn.CreateCommand()
    $cmd.CommandText = $query

    $reader = $cmd.ExecuteReader()

    $results = @()
    while ($reader.Read()) {
        $row = @{}
        for ($i = 0; $i -lt $reader.FieldCount; $i++) {
            $row[$reader.GetName($i)] = $reader[$i]
        }
        $results += [pscustomobject]$row
    }
    $reader.Close()

    Write-Host "`nQuery Results:`n" -ForegroundColor Cyan
    $results | Format-Table -AutoSize
} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    $conn.Close()
    Write-Host "Connection closed."
}
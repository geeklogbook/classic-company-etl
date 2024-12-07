# You need to install: https://dev.mysql.com/downloads/file/?id=534712

# MySQL Connection Information
$server = "localhost"
$database = "base_negocio"
$user = "root"


# SQL Query
$query = "SELECT * FROM cargo"

# MySQL Connection String
$connStr = "server=$server;user=$user;database=$database;password=$password;"

# Create MySQL Connection
$conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connStr)

try {
    $conn.Open()
    Write-Host "Connection to MySQL database successful."

    $cmd = $conn.CreateCommand()
    $cmd.CommandText = $query

    # Execute the query and read the data
    $reader = $cmd.ExecuteReader()

    # Collect rows for better output formatting
    $results = @()
    while ($reader.Read()) {
        $row = @{}
        for ($i = 0; $i -lt $reader.FieldCount; $i++) {
            $row[$reader.GetName($i)] = $reader[$i]
        }
        $results += [pscustomobject]$row
    }
    $reader.Close()

    # Display results in a table format
    Write-Host "`nQuery Results:`n" -ForegroundColor Cyan
    $results | Format-Table -AutoSize
} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    $conn.Close()
    Write-Host "Connection closed."
}
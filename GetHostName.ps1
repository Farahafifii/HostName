Import-Csv -path "$PSScriptRoot\ip-Addresses.csv"-Header "IPAddress" , "HostName" | ForEach-Object{
$hostname = ([System.Net.Dns]::GetHostByAddress($_.IPAddress)).Hostname.ToUpper()
if($? -eq $False){
$hostname="Cannot resolve hostname"
}
New-Object -TypeName PSObject -Property @{

      HostName = $hostname
      IPAddress = $_.IPAddress
      
}} | Export-Csv C:machinenames.csv -NoTypeInformation -Encoding UTF8

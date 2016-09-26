$cim = New-CimSession -ComputerName MAS-BGPNAT01
$ip = Get-NetIPAddress -AddressFamily IPv4 -CimSession $cim| ? {($_.IPAddress -ne '127.0.0.1') -and ($_.IPAddress -NotMatch '192.168') } 
Add-NetNatStaticMapping -ExternalIPAddress $ip.IPAddress -ExternalPort 3389 -InternalIPAddress 192.168.200.6 -NatName BGPNAT -Protocol TCP -InternalPort 3389 -CimSession $cim
Remove-CimSession $cim
Write-Host "Youn now RDP to your console on IP address " $ip.IPAddress

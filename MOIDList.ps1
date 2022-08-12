Connect-VIServer -Server 10.107.42.74 -Protocol https -User root -Password 1qaz@@WSX
Get-VM| Format-Table -Property Name,ID -AutoSize
Disconnect-VIServer -Confirm:$false 
Connect-VIServer -Server 10.107.42.73 -Protocol https -User root -Password 1qaz@WSX
Get-VM | Format-Table -Property Name,ID -AutoSize
Disconnect-VIServer -Confirm:$false 
Connect-VIServer -Server 10.107.42.70 -Protocol https -User root -Password 1qaz@WSX
Get-VM | Format-Table -Property Name,ID -AutoSize
Disconnect-VIServer -Confirm:$false 
Connect-VIServer -Server 10.107.42.101 -Protocol https -User root -Password 1qaz@WSX
Get-VM | Format-Table -Property Name,ID -AutoSize
Disconnect-VIServer -Confirm:$false
Connect-VIServer -Server 10.107.41.70 -Protocol https -User root -Password 1qaz@@WSX
Get-VM | Format-Table -Property Name,ID -AutoSize
Disconnect-VIServer -Confirm:$false  
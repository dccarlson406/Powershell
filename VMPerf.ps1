$hosts=@("Host1","Host2","Host3","Host4")
$IPs=@("10.107.42.101","10.107.42.70","10.107.42.73","10.107.42.74")
$credp=@("1qaz@WSX","1qaz@WSX","1qaz@WSX","1qaz@@WSX")

$i=0
$obj=New-Object System.Data.DataTable
[void]$obj.Columns.Add("Host")
[void]$obj.Columns.Add("IP")
[void]$obj.Columns.Add("CPU")
[void]$obj.Columns.Add("Mem")

foreach($box in $hosts)
{
    Connect-VIServer -Server $IPs[$i] -Protocol https -User root -Password $credp[$i] | Out-Null
    $hctot= Get-VMHost -Name $IPs[$i] | Select-Object CpuTotalMhz
    $hcuse= Get-VMHost -Name $IPs[$i] | Select-Object CpuusageMhz
    $hmtot= Get-VMHost -Name $IPs[$i] | Select-Object MemoryTotalGB
    $hmuse= Get-VMHost -Name $IPs[$i] | Select-Object MemoryUsageGB
    $Cutil = [string]([math]::Round((($hcuse.CpuUsageMhz / $hctot.CpuTotalMhz) * 100),2))+"%"
    $Mutil = [string]([math]::Round((($hmuse.MemoryUsageGB / $hmtot.MemoryTotalGB) * 100),2))+"%"
    [void]$obj.Rows.Add($box,$IPs[$i],$Cutil,$Mutil)
    $i++
    
}
$obj | Format-Table -Property @{e='Host';Width=7}, @{e='IP';Width=16}, @{e='CPU';Width=7}, @{e='Mem';Width=7}


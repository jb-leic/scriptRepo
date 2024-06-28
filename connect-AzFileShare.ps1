$connectTestResult = Test-NetConnection -ComputerName stleiuks5umru7k5hffdy.privatelink.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\stleiuks5umru7k5hffdy.privatelink.file.core.windows.net\erosfiles" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}
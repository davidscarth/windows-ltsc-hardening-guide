# firewall.ps1
# Set Windows Firewall to Block Outbound connections (and allow Local Policies to be set)

# Environment Variables
# Change path if your LGPO.exe exists somewhere else
$lgpoPath = "C:\Temp\Baselines\Security\Scripts\Tools\LGPO.exe"
$policyFile = Join-Path -Path $env:TEMP -ChildPath "Temp-Firewall-Policy.txt"

# Check for LGPO.exe
if (-not (Test-Path $lgpoPath)) {
    Write-Error "LGPO.exe not found at '$lgpoPath'. Please ensure the file exists at that location."
    exit 1
}

# Define the policy
$policyContent = @"
Computer
SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile
DefaultOutboundAction
DWORD:1

Computer
SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile
DefaultOutboundAction
DWORD:1

Computer
SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile
DefaultOutboundAction
DWORD:1

Computer
SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile
AllowLocalPolicyMerge
DWORD:1
"@

# Create the temporary policy file
try {
    Set-Content -Path $policyFile -Value $policyContent -Encoding ASCII -Force -ErrorAction Stop
    Write-Host "Successfully created temporary policy file." -ForegroundColor Green
}
catch {
    Write-Error "Failed to create policy file. Error: $($_.Exception.Message)"
    exit 1
}

# Apply the policy using LGPO.exe
Write-Host "Applying firewall policy with LGPO.exe..." -ForegroundColor Yellow
& $lgpoPath /t $policyFile
if ($LASTEXITCODE -ne 0) {
    Write-Error "LGPO.exe failed to apply the policy."
} else {
    Write-Host "LGPO.exe successfully merged the policy." -ForegroundColor Green
}

# Force the Group Policy engine to apply the changes
Write-Host "Forcing Group Policy update..." -ForegroundColor Yellow
gpupdate /force

# Clean up temporary files
Remove-Item -Path $policyFile -Force
Write-Host "Cleanup complete. Firewall policy has been updated." -ForegroundColor Cyan
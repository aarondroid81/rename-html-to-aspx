//# Connect to SharePoint Online
Connect-SPOService -Url "https://yourtenant-admin.sharepoint.com" -Credential (Get-Credential)

# Specify the site URL and library name
$siteUrl = "https://yourtenant.sharepoint.com/sites/YourSite"
$libraryName = "Documents"

# Upload HTML files from a local directory
$localDirectory = "C:\Path\To\Your\HTML\Files"
Get-ChildItem -Path $localDirectory -Filter "*.html" | ForEach-Object {
    Add-PnPFile -Folder "$libraryName" -FileName $_.Name -Stream $_.OpenRead() -Values @{Title = $_.BaseName}
}

# Set permissions for a specific group
$groupName = "Your SharePoint Group"
$permissionLevel = "Contribute"  # Adjust as needed (e.g., Read, Edit, Full Control)

Add-PnPSiteGroup -Site $siteUrl -Group $groupName -PermissionLevel $permissionLevel

# Configure site structure (e.g., create subsites, lists, etc.)
# Example: Create a subsite
New-PnPTeamsSite -DisplayName "New Subsite" -Alias "newsubsite" -Description "Subsite description"

Write-Host "HTML files uploaded, permissions set, and site structure configured successfully!"

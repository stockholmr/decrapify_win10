$Remove = @(
    "Microsoft.549981C3F5F10" # Cortana
    "Microsoft.YourPhone"                   
    "Microsoft.ZuneMusic"                   
    "Microsoft.ZuneVideo"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxApp"      
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.SkypeApp"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.GetHelp"                     
    "Microsoft.Getstarted"
    "Microsoft.BingWeather"
    "Microsoft.People"
);

Get-AppXProvisionedPackage -Online | Where-Object { (Select-String -SimpleMatch -Quiet -InputObject $_.PackageName -Pattern $Remove | Sort | Get-Unique )} | Remove-AppxProvisionedPackage -Online;                                         

Get-AppPackage | Where-Object { (Select-String -SimpleMatch -Quiet -InputObject $_.PackageFullName -Pattern $Remove | Sort | Get-Unique )} | Remove-AppPackage

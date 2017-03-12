$MsiUrl = 'https://s3.amazonaws.com/aws-cli/AWSCLI64.msi'
$install_args = @('/qn', '/norestart','/i', $MsiUrl)      
Write-Host 'Installing Puppet. Running msiexec.exe $install_args'
$process = Start-Process -FilePath msiexec.exe -ArgumentList $install_args -Wait -PassThru
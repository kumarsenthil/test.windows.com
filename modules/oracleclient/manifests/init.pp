class oracleclient {
	
	exec { "Download Oracle client":
      command   => "Invoke-WebRequest https://s3.amazonaws.com/testdemo4321/win64_11gR2_client.zip -OutFile C:\\win64_11gR2_client.zip;Start-Sleep -s 300",
      provider  => powershell,
      logoutput => true,
    }
}
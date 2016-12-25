class oracleclient {
	
	exec { "Download Oracle client":
      command   => "Invoke-WebRequest  https://s3.amazonaws.com/test-dev-cdn-watch-aetnd-com/Tensorflow.docx -OutFile C:\\test.docx;Start-Sleep -s 300",
      provider  => powershell,
      logoutput => true,
    }
}
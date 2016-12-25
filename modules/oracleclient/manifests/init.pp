class oracleclient {
	
	exec { "Download Oracle client":
      command   => "https://s3.amazonaws.com/test-dev-cdn-watch-aetnd-com/Tensorflow.docx;Start-Sleep -s 300",
      provider  => powershell,
      logoutput => true,
    }
}
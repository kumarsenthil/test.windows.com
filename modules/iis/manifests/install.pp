class iis::install {
	
	exec { "import servermanager":
      command   => "import-module servermanager",
      provider  => powershell,
      logoutput => true,
    }

    exec { "install iis":
      command   => "add-windowsfeature web-server -includeallsubfeature;Start-Sleep -s 600",
      provider  => powershell,
      timeout   => 0,
      logoutput => true,
    }

}
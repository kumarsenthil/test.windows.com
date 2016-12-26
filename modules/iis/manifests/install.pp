class iis::install {
	
	exec { "import servermanager":
      command   => "import-module servermanager",
      provider  => powershell,
      logoutput => true,
    }

    exec { "install iis":
      command   => "add-windowsfeature web-server -includeallsubfeature;Start-Sleep -s 420",
      provider  => powershell,
      logoutput => true,
    }

}
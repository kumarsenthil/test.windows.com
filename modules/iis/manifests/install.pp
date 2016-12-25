class iis::install {
	
	exec { "import servermanager":
      command   => "import-module servermanager",
      provider  => powershell,
      logoutput => true,
    }

    exec { "install iis":
      command   => "add-windowsfeature web-server -includeallsubfeature",
      provider  => powershell,
      logoutput => true,
    }

}
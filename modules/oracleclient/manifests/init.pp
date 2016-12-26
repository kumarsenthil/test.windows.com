class oracleclient {

	exec { "Download JRE":
      command   => "Invoke-WebRequest https://s3.amazonaws.com/testdemo4321/jdk1.8.0_111.zip -OutFile C:\\jdk1.8.0_111.zip;Start-Sleep -s 60",
      provider  => powershell,
      creates 	=> "C:\\jdk1.8.0_111.zip",
      logoutput => true,
      before	=> Exec["Install JRE"],
    }

    exec { "Install JRE":
      command   => "Add-Type -assembly 'system.io.compression.filesystem';[io.compression.zipfile]::ExtractToDirectory('C:\\jdk1.8.0_111.zip', 'C:\\jdk1.8.0_111')",
      provider  => powershell,
      creates 	=> "C:\\jdk1.8.0_111.zip",
      logoutput => true,
      require	=> Exec["Download JRE"],
    }
	
	exec { "Download Oracle client":
      command   => "Invoke-WebRequest https://s3.amazonaws.com/testdemo4321/win64_11gR2_client.zip -OutFile C:\\win64_11gR2_client.zip;Start-Sleep -s 600",
      provider  => powershell,
      creates 	=> "C:\\win64_11gR2_client.zip",
      logoutput => true,
      require	=> Exec["Install JRE"],
    }

    exec { "Extract the Oracle client":
      command   => "Add-Type -assembly 'system.io.compression.filesystem';[io.compression.zipfile]::ExtractToDirectory('C:\\win64_11gR2_client.zip', 'C:\\');Start-Sleep -s 300",
      provider  => powershell,
      logoutput => true,
      creates 	=> "C:\\client",
      require	=> Exec["Download Oracle client"],
    }

    file { "deploy response file":
	    path    => 'C:\\client\\responsefile.rsb',
	    owner   => 'Administrator',
	    group   => 'Administrator',
	    source  => "puppet:///modules/oracleclient/responsefile.rsp",
	    backup  => false,
	    require	=> Exec["Extract the Oracle client"],
	    before	=> Exec["Install Oracle client"],
	}    

    exec { "Install Oracle client":
      command   => "setup -jreLoc C:\\jdk1.8.0_111 -responseFile C:\\client\\responsefile.rsp -silent ;Start-Sleep -s 300",
      provider  => powershell,
      cwd		=> "C:\\client",
      logoutput => true,
      creates 	=> "C:\\client",
      require	=> File["deploy response file"],
    }

}
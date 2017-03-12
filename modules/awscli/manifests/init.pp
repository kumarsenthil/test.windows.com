class awscli {

	file { "deploy awscli install ps":
    path    => 'C:\\awscli.ps1',
    owner   => 'Administrator',
    group   => 'Administrator',
    source  => "puppet:///modules/awscli/awscli.ps1",
    backup  => false,
    before	=> Exec["Install awscli"],
	} 

	exec { "Install awscli":
    command   => "& .\awscli.ps1",
    provider  => powershell,
    cwd		    => "C:\\",
    logoutput => true,
    timeout   => 0,
    require	=> File["deploy awscli install ps"],
  }

 }
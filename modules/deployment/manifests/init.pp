class deployment {
	
	exec { "Download JRE":
      command   => "Invoke-WebRequest https://s3.amazonaws.com/testdemo4321/appcode/Default.aspx -OutFile C:\inetpub\wwwroot\mysite\Default.aspx -s 10",
      provider  => powershell,
      logoutput => true,
      timeout   => 0,
    }
 }
node default {
  
  notify{ "This is COOL":}

  /* class { "oracleclient": } */

  class { "iis::install": }

  iis::manage_app_pool {'application_pool':
    enable_32_bit           => true,
    managed_runtime_version => 'v4.0',
    require                 => Class['iis::install']
  }

   iis::manage_site {'dev.test.com':
    site_path     => 'C:\inetpub\wwwroot\mysite',
    site_id       => '10',
    port          => '80',
    ip_address    => '*',
    host_header   => 'dev.test.com',
    app_pool      => 'application_pool',
    require       => Class['iis::install']
  } 
	
}

node "qa-test-com" {
	
}

node "www-test-com" {
	
}
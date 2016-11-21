node "dev-test-com" {
  
  notify{ "This is COOL":}

   iis::manage_app_pool {'application_pool':
    enable_32_bit           => true,
    managed_runtime_version => 'v4.0',
  }

   iis::manage_site {'dev.test.com':
    site_path     => 'C:\inetpub\wwwroot\mysite',
    site_id       => '10'
    port          => '80',
    ip_address    => '*',
    host_header   => 'dev.test.com',
    app_pool      => 'my_application_pool'
  }
	
}

node "qa-test-com" {
	
}

node "www-test-com" {
	
}
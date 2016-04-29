class argus::pepd (
  $pap_host                                           = $argus::params::pap_host,
  $pap_port                                           = $argus::params::pap_port,
  $pdp_host                                           = $argus::params::pdp_host,
  $pdp_port                                           = $argus::params::pdp_port,
  $pep_host                                           = $argus::params::pep_host,
  $pep_port                                           = $argus::params::pep_port,
  $pep_conf_dir                                       = $argus::params::pep_conf_dir,
  $pep_conf                                           = $argus::params::pep_conf,
  $pep_admin_password                                 = $argus::params::pep_admin_password,
  $pep_pips                                           = $argus::params::pep_pips,
  $pep_obligation_handlers                            = $argus::params::pep_obligation_handlers,
  $pep_enable_ssl                                     = $argus::params::pep_enable_ssl,
  $req_client_cert_auth                               = $argus::params::req_client_cert_auth,
  $request_validator_pip_parser_class                 = $argus::params::request_validator_pip_parser_class,
  $request_validator_pip_validate_request_subjects    = $argus::params::request_validator_pip_validate_request_subjects,
  $request_validator_pip_validate_request_resources   = $argus::params::request_validator_pip_validate_request_resources,
  $request_validator_pip_validate_request_action      = $argus::params::request_validator_pip_validate_request_action,
  $request_validator_pip_validate_request_environment = $argus::params::request_validator_pip_validate_request_environment,
  $openssl_pip_parser_class                           = $argus::params::openssl_pip_parser_class,
  $openssl_pip_subject_attribute_ids                  = $argus::params::openssl_pip_subject_attribute_ids,
  $openssl_pip_subject_attribute_datatypes            = $argus::params::openssl_pip_subject_attribute_datatypes,
  $glite_xacml_pip_parser_class                       = $argus::params::glite_xacml_pip_parser_class,
  $glite_xacml_pip_accepted_profile_ids               = $argus::params::glite_xacml_pip_accepted_profile_ids,
  $common_xacml_pip_parser_class                      = $argus::params::common_xacml_pip_parser_class,
  $common_xacml_pip_accepted_profile_ids              = $argus::params::common_xacml_pip_accepted_profile_ids,
  $account_map_parser_class                           = $argus::params::account_map_parser_class,
  $account_map_file                                   = $argus::params::account_map_file,
  $group_map_file                                     = $argus::params::group_map_file,
  $grid_map_dir                                       = $argus::params::grid_map_dir,
  $voms_dir                                           = $argus::params::voms_dir,
  $voms_map_file                                      = $argus::params::voms_map_file

) inherits argus::params {

  require argus::commons

  class { 'argus::pepd::install': }->
  class { 'argus::pepd::configure':
    pap_host                                           => $pap_host,
	  pap_port                                           => $pap_port,
	  pdp_host                                           => $pdp_host,
	  pdp_port                                           => $pdp_port,
	  pep_host                                           => $pep_host,
	  pep_port                                           => $pep_port,
	  pep_conf_dir                                       => $pep_conf_dir,
	  pep_conf                                           => $pep_conf,
	  pep_admin_password                                 => $pep_admin_password,
	  pep_pips                                           => $pep_pips,
	  pep_obligation_handlers                            => $pep_obligation_handlers,
	  pep_enable_ssl                                     => $pep_enable_ssl,
	  req_client_cert_auth                               => $req_client_cert_auth,
	  request_validator_pip_parser_class                 => $request_validator_pip_parser_class,
	  request_validator_pip_validate_request_subjects    => $request_validator_pip_validate_request_subjects,
	  request_validator_pip_validate_request_resources   => $request_validator_pip_validate_request_resources,
	  request_validator_pip_validate_request_action      => $request_validator_pip_validate_request_action,
	  request_validator_pip_validate_request_environment => $request_validator_pip_validate_request_environment,
	  openssl_pip_parser_class                           => $openssl_pip_parser_class,
	  openssl_pip_subject_attribute_ids                  => $openssl_pip_subject_attribute_ids,
	  openssl_pip_subject_attribute_datatypes            => $openssl_pip_subject_attribute_datatypes,
	  glite_xacml_pip_parser_class                       => $glite_xacml_pip_parser_class,
	  glite_xacml_pip_accepted_profile_ids               => $glite_xacml_pip_accepted_profile_ids,
	  common_xacml_pip_parser_class                      => $common_xacml_pip_parser_class,
	  common_xacml_pip_accepted_profile_ids              => $common_xacml_pip_accepted_profile_ids,
	  account_map_parser_class                           => $account_map_parser_class,
	  account_map_file                                   => $account_map_file,
	  group_map_file                                     => $group_map_file,
	  grid_map_dir                                       => $grid_map_dir,
	  voms_dir                                           => $voms_dir,
	  voms_map_file                                      => $voms_map_file
  }->
  class { 'argus::pepd::service': }

}

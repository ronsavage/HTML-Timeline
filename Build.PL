use Module::Build;

Module::Build -> new
(
 module_name    => 'HTML::Timeline',
 license        => 'artistic',
 dist_abstract  => 'Convert a Gedcom file into a Timeline file',
 dist_author    => 'Ron Savage <ron@savage.net.au>',
 build_requires =>
 {
	 Test::More => 0,
	 Test::Pod  => 0,
 },
 requires =>
 {
	 accessors        => 0,
	 Carp             => 0,
	 Config::IniFiles => 0,
	 Gedcom           => 0,
	 Gedcom::Date     => 0,
	 HTML::Template   => 0,
	 Path::Class      => 0,
 },
) -> create_build_script();

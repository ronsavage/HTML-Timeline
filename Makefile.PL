use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

WriteMakefile
(
 ($] ge '5.005') ?
 (
  AUTHOR   => 'Ron Savage (ron@savage.net.au)',
  ABSTRACT => 'Convert a Gedcom file into a Timeline file',
 ) : (),
 clean =>
 {
	 FILES => 'blib/* Makefile MANIFEST HTML-Timeline-*'
 },
 dist =>
 {
	 COMPRESS => 'gzip',
	 SUFFIX   => 'gz'
 },
 DISTNAME  => 'HTML-Timeline',
 NAME      => 'HTML::Timeline',
 PL_FILES  => {},
 PREREQ_PM =>
 {
	 accessors        => 0,
	 Carp             => 0,
	 Config::IniFiles => 0,
	 Gedcom           => 0,
	 Gedcom::Date     => 0,
	 HTML::Template   => 0,
	 Path::Class      => 0,
	},
	VERSION_FROM => 'lib/HTML/Timeline.pm',
);

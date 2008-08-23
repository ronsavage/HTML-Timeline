#!/usr/bin/perl
#
# Name:
#	timeline.pl.
#
# Description:
#	Convert a Gedcom file into a Timeline file.
#
# Output:
#	o Exit value
#
# History Info:
#	Rev		Author		Date		Comment
#	1.00   	Ron Savage	20080811	Initial version <ron@savage.net.au>

use strict;
use warnings;

use Getopt::Long;
use Pod::Usage;
use HTML::Timeline;

# --------------------

my($option_parser) = Getopt::Long::Parser -> new();

my(%option, @option);

push @option, 'ancestors';
push @option, 'everyone';
push @option, 'gedcom_file=s';
push @option, 'help';
push @option, 'include_spouses';
push @option, 'output_dir=s';
push @option, 'root_person=s';
push @option, 'template_dir=s';
push @option, 'template_name=s';
push @option, 'timeline_height=i';
push @option, 'url_for_xml=s';
push @option, 'verbose';
push @option, 'web_page=s';
push @option, 'xml_file=s';

if ($option_parser -> getoptions(\%option, @option) )
{
	pod2usage(1) if ($option{'help'});

	exit HTML::Timeline -> new(options => \%option) -> run();
}
else
{
	pod2usage(2);
}

__END__

=pod

=head1 NAME

timeline.pl - Convert a Gedcom file into a Timeline file

=head1 SYNOPSIS

timeline.pl [options]

	Options:
	-ancestors
	-everyone
	-gedcom_file a_file_name
	-help
	-include_spouses
	-output_dir a_dir_name
	-root_person a_personal_name
	-template_dir a_dir_name
	-template_name a_file_name
	-timeline_height an_integer
	-url_for_xml a_url
	-verbose
	-web_page a_file_name
	-xml_file a_file_name

Exit value:

=over 4

=item Zero

Success.

=item Non-Zero

Error.

=back

=head1 OPTIONS

=over 4

=item -ancestors

If this option is used, the ancestors of the root_person (see below) are processed.

If this option is not used, their descendents are processed.

=item -everyone

If this option is used, everyone is processed, and the root_person (see below) is ignored.

If this option is not used, the root_person is processed.

=item -gedcom_file a_file_name

The name of your Gedcom input file.

The default value is bach.ged (so timeline.pl runs OOTB [out-of-the-box]).

=item -help

Print help and exit.

=item -include_spouses

If this option is used, and descendents are processed, spouses are included.

If this option is not used, spouses are ignored.

=item -output_dir a_dir_name

If this option is used, the output HTML and XML files will be created in this directory.

=item -root_person a_personal_name

The name of the person on which to base the timeline.

The default is 'Johann Sebastian Bach'.

=item -template_dir a_dir_name

If this option is used, HTML::Template will look in this directory for 'timeline.tmpl'.

If this option is not used, the current directory will be used.

=item -template_name a_file_name

If this option is used, HTML::Template will look for a file of this nam'.

If this option is not used, 'timeline.tmpl' will be used.

=item -timeline_height an_integer

If this option is used, the height of the timeline is set to this value in pixels.

If this option is not used, the height defaults to 500 pixels.

=item -url_for_xml a_url

If this option is used, it becomes the prefix of the name of the output XML file written into timeline.html.

If this option is not used, no prefix is used.

Warning: I could not get the Timeline package to load the XML file when using /search for this option,
even though the timeline.html was in Apache's doc root, and timeline.xml was in the /search dir below
the doc root. So don't use this option until someone debugs it.

=item -verbose

Print verbose messages.

The default value for verbose is 0.

=item -web_page a_file_name

If this option is used, it specfies the name of the HTML file to write.

If this option is not used, 'timeline.html' is written.

See the output_dir option for where the file is written.

=item -xml_file a_file_name

The name of your output XML file.

The default value is 'timeline.xml'.

Note: The name of the output XML file is embedded in timeline.html, at line 28.
You will need to edit this file if you do not use 'timeline.xml' as your output XML file.

=back

=head1 DESCRIPTION

timeline.pl converts a Gedcom file into a Timeline file.

See http://simile.mit.edu/timeline for details.

=cut

use strict;
use warnings;

use Module::Build;

# -----------------------------------------------

my $class = Module::Build->subclass(code => <<'EOF');

sub ACTION_authortest
{
	my($self) = @_;

	$self->depends_on('build');
	$self->depends_on('manifest');
	$self->depends_on('distmeta');

	$self->test_files( qw< t xt/author > );
	$self->recursive_test_files(1);

	$self->depends_on('test');

	return;
}
EOF

$class -> new
(
	module_name    => 'HTML::Timeline',
	license        => 'artistic_2',
	dist_abstract  => 'Convert a Gedcom file into a Timeline file',
	dist_author    => 'Ron Savage <ron@savage.net.au>',
	build_requires =>
	{
		'Test::More' => 1.001014,
		'Test::Pod' => 1.48,
	},
	configure_requires =>
	{
		'Module::Build' => 0.4211,
	},
	requires =>
	{
		'accessors' => 0,
		'Carp' => 0,
		'Config::IniFiles' => 0,
		'Gedcom' => 0,
		'Gedcom::Date' => 0,
		'HTML::Template' => 0,
		'Path::Class' => 0,
	},
	resources =>
	{
		'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html?Name=HTML-Timeline',
		'license' => 'http://opensource.org/licenses/Artistic-2.0',
		'repository' => 'https://github.com/ronsavage/HTML-Timeline',
	},
		'script_files' => ['bin/timeline.pl'],
) -> create_build_script();

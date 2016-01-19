use strict;
use warnings;

use File::Spec;
use File::Temp;

use Image::Magick::CommandParser;

use Test::Stream -Classic;

# ------------------------------------------------

my(@test) =
(
{
	input	=> 'convert logo:',
	expect	=>
	{
	  command => "convert",
	  input_file => "logo:",
	  options => [],
	  output_file => ""
	}
},
{
	input	=> 'convert logo: output.png',
	expect	=>
	{
		command => "convert",
		input_file => "logo:",
		options => [],
		output_file => "output.png"
	}
},
{
	input	=> 'convert logo: -size 320x85 output.png',
	expect	=>
	{
		command => "convert",
		input_file => "logo:",
		options => [
		{
			name => "action_set",
			param => [
	  		"-",
	  		"size",
	  		"320x85"
	  		]
		}
		],
		output_file => "output.png"
	}
},
{
	input	=> 'convert logo: -size 320x85 -shade 110x90 output.png',
	expect	=>
	{
		command => "convert",
		input_file => "logo:",
		options => [
			{
			name => "action_set",
			param => [
			"-",
			"size",
			"320x85"
			]
			},
			{
			name => "action_set",
			param => [
			"-",
			"shade",
			"110x90"
			]
			}
		],
		output_file => "output.png"
	}
},
{
	input	=> 'convert logo: -size 320x85 canvas:none -shade 110x90 output.png',
	expect	=>
	{
		command => "convert",
		input_file => "logo:",
		options => [
			{
				name => "action_set",
				param => [
					"-",
					"size",
					"320x85"
				]
			},
			{
				name => "operator",
				param => [
					"canvas:none"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"shade",
					"110x90"
				]
			}
		],
		output_file => "output.png"
	}
},
{
	input	=> 'convert logo: -size 320x85 ( +clone canvas:none -shade 110x90 ) output.png',
	expect	=>
	{
		command => "convert",
		input_file => "logo:",
		options => [
			{
				name => "action_set",
				param => [
					"-",
					"size",
					"320x85"
				]
			},
			{
				name => "open_parenthesis",
				param => [
					"("
				]
			},
			{
				name => "action_set",
				param => [
					"+",
					"clone"
				]
			},
			{
				name => "operator",
				param => [
					"canvas:none"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"shade",
					"110x90"
				]
			},
			{
				name => "close_parenthesis",
				param => [
					")"
				]
			}
		],
		output_file => "output.png"
	}
},
{
	input	=> 'convert logo: -size 320x85 ( canvas:none +clone -shade 110x90 ) output.png',
	expect	=>
	{
		command => "convert",
		input_file => "logo:",
		options => [
			{
				name => "action_set",
				param => [
					"-",
					"size",
					"320x85"
				]
			},
			{
				name => "open_parenthesis",
				param => [
					"("
				]
			},
			{
				name => "operator",
				param => [
					"canvas:none"
				]
			},
			{
				name => "action_set",
				param => [
					"+",
					"clone"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"shade",
					"110x90"
				]
			},
			{
				name => "close_parenthesis",
				param => [
					")"
				]
			}
		],
		output_file => "output.png"
	}
},
{
	input	=> 'convert logo: canvas:none +clone output.png',
	expect	=>
	{
		command => "convert",
		input_file => "logo:",
		options => [
			{
				name => "operator",
				param => [
					"canvas:none"
				]
			},
			{
				name => "action_set",
				param => [
					"+",
					"clone"
				]
			}
		],
		output_file => "output.png"
	}
},
{
	input	=> 'convert xc: -gravity East output.png',
	expect	=>
	{
		command => "convert",
		input_file => "xc:",
		options => [
			{
				name => "action_set",
				param => [
					"-",
					"gravity"
				]
			},
			{
				name => "operator",
				param => [
					"East"
				]
			}
		],
		output_file => "output.png"
		}
},
);
my($parser)	= Image::Magick::CommandParser -> new;
my($count)	= 0;

my($got);
my($result);

for my $test (@test)
{
	$count++;

	$parser -> command($$test{input});

	$result = $parser -> run;

	if ($result == 0)
	{
		$got = $parser -> result;

		is_deeply($got, $$test{expect}, $$test{input});
	}
	else
	{
		die "Test $count failed to return 0 from run()\n";
	}
}

done_testing;

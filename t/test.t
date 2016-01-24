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
				action => "action_set",
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
				action => "action_set",
				param => [
				"-",
				"size",
				"320x85"
				]
				},
				{
				action => "action_set",
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
				action => "action_set",
				param => [
					"-",
					"size",
					"320x85"
				]
			},
			{
				action => "operator",
				param => [
					"canvas:none"
				]
			},
			{
				action => "action_set",
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
				action => "action_set",
				param => [
					"-",
					"size",
					"320x85"
				]
			},
			{
				action => "open_parenthesis",
				param => [
					"("
				]
			},
			{
				action => "action_set",
				param => [
					"+",
					"clone"
				]
			},
			{
				action => "operator",
				param => [
					"canvas:none"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"shade",
					"110x90"
				]
			},
			{
				action => "close_parenthesis",
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
				action => "action_set",
				param => [
					"-",
					"size",
					"320x85"
				]
			},
			{
				action => "open_parenthesis",
				param => [
					"("
				]
			},
			{
				action => "operator",
				param => [
					"canvas:none"
				]
			},
			{
				action => "action_set",
				param => [
					"+",
					"clone"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"shade",
					"110x90"
				]
			},
			{
				action => "close_parenthesis",
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
				action => "operator",
				param => [
					"canvas:none"
				]
			},
			{
				action => "action_set",
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
				action => "action_set",
				param => [
					"-",
					"gravity",
					"East"
				]
			},
		],
		output_file => "output.png"
		}
},
{
	input	=> 'convert rose.jpg rose.png',
	expect	=>
	{
		command => "convert",
		input_file => "rose.jpg",
		options => [],
		output_file => "rose.png"
	}
},
{
	input	=> 'convert rose.jpg -resize 50% rose.png',
	expect	=>
	{
		command => "convert",
		input_file => "rose.jpg",
		options => [
			{
				action => "action_set",
				param => [
					"-",
					"resize",
					"50%"
				]
			}
		],
		output_file => "rose.png"
	}
},
{
	input	=> 'convert label.gif -compose Plus button.gif',
	expect	=>
	{
		command => "convert",
		input_file => "label.gif",
		options => [
			{
				action => "action_set",
				param => [
					"-",
					"compose",
					"Plus"
				]
			},
		],
		output_file => "button.gif"
	}
},
{
	input	=> 'convert label.gif ( +clone -shade 110x90 -normalize -negate +clone -compose Plus -composite ) button.gif',
	expect	=>
	{
		command => "convert",
		input_file => "label.gif",
		options => [
			{
				action => "open_parenthesis",
				param => [
					"("
				]
			},
			{
				action => "action_set",
				param => [
					"+",
					"clone"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"shade",
					"110x90"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"normalize"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"negate"
				]
			},
			{
				action => "action_set",
				param => [
					"+",
					"clone"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"compose",
					"Plus"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"composite"
				]
			},
			{
				action => "close_parenthesis",
				param => [
					")"
				]
			}
		],
		output_file => "button.gif"
	}
},
{
	input	=> 'convert label.gif ( +clone -shade 110x90 -normalize -negate +clone -compose Plus -composite ) ( -clone 0 -shade 110x50 -normalize -channel BG -fx 0 +channel -matte ) -delete 0 +swap -compose Multiply -composite button.gif',
	expect	=>
	{
		command => "convert",
		input_file => "label.gif",
		options => [
			{
				action => "open_parenthesis",
				param => [
					"("
				]
			},
			{
				action => "action_set",
				param => [
					"+",
					"clone"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"shade",
					"110x90"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"normalize"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"negate"
				]
			},
			{
				action => "action_set",
				param => [
					"+",
					"clone"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"compose",
					"Plus"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"composite"
				]
			},
			{
				action => "close_parenthesis",
				param => [
					")"
				]
			},
			{
				action => "open_parenthesis",
				param => [
					"("
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"clone",
					0
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"shade",
					"110x50"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"normalize"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"channel"
				]
			},
			{
				action => "operator",
				param => [
					"BG"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"fx",
					0
				]
			},
			{
				action => "action_set",
				param => [
					"+",
					"channel"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"matte"
				]
			},
			{
				action => "close_parenthesis",
				param => [
					")"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"delete",
					0
				]
			},
			{
				action => "action_set",
				param => [
					"+",
					"swap"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"compose",
					"Multiply"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"composite"
				]
			}
		],
		output_file => "button.gif"
	}
},
{
	input	=> 'convert magick:logo -label "%m:%f %wx%h" logo.png',
	expect	=>
	{
		command => "convert",
		input_file => "magick:logo",
		options => [
			{
				action => "action_set",
				param => [
					"-",
					"label",
					"%m:%f"
				]
			},
			{
				action => "operator",
				param => [
					"%wx%h"
				]
			}
		],
		output_file => "logo.png"
	}
},
{
	input	=> 'convert magick:rose -label @t/info.txt -format "%l label" rose.png',
	expect	=>
	{
		command => "convert",
		input_file => "magick:rose",
		options => [
			{
				action => "action_set",
				param => [
					"-",
					"label",
					"\@t/info.txt"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"format"
				]
			},
			{
				action => "operator",
				param => [
					"%l"
				]
			},
			{
				action => "operator",
				param => [
					"label"
				]
			}
		],
		output_file => "rose.png"
	}
},
{
	input	=> 'convert -label @t/info.txt magick:rose -format "%l label" rose.png',
	expect	=>
	{
		command => "convert",
		input_file => "magick:rose",
		options => [
			{
				action => "action_set",
				param => [
					"-",
					"label",
					"\@t/info.txt"
				]
			},
			{
				action => "action_set",
				param => [
					"-",
					"format"
				]
			},
			{
				action => "operator",
				param => [
					"%l"
				]
			},
			{
				action => "operator",
				param => [
					"label"
				]
			}
		],
		output_file => "rose.png"
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

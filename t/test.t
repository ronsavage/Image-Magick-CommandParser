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
				name => "action_set",
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
				name => "action_set",
				param => [
					"-",
					"compose"
				]
			},
			{
				name => "operator",
				param => [
					"Plus"
				]
			}
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
				name => "action_set",
				param => [
					"-",
					"shade",
					"110x90"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"normalize"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"negate"
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
					"compose"
				]
			},
			{
				name => "operator",
				param => [
					"Plus"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"composite"
				]
			},
			{
				name => "close_parenthesis",
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
				name => "action_set",
				param => [
					"-",
					"shade",
					"110x90"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"normalize"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"negate"
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
					"compose"
				]
			},
			{
				name => "operator",
				param => [
					"Plus"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"composite"
				]
			},
			{
				name => "close_parenthesis",
				param => [
					")"
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
					"-",
					"clone",
					0
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"shade",
					"110x50"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"normalize"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"channel"
				]
			},
			{
				name => "operator",
				param => [
					"BG"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"fx",
					0
				]
			},
			{
				name => "action_set",
				param => [
					"+",
					"channel"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"matte"
				]
			},
			{
				name => "close_parenthesis",
				param => [
					")"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"delete",
					0
				]
			},
			{
				name => "action_set",
				param => [
					"+",
					"swap"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"compose"
				]
			},
			{
				name => "operator",
				param => [
					"Multiply"
				]
			},
			{
				name => "action_set",
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
				name => "action_set",
				param => [
					"-",
					"label"
				]
			},
			{
				name => "operator",
				param => [
					"%m:%f"
				]
			},
			{
				name => "operator",
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
				name => "action_set",
				param => [
					"-",
					"label",
					"\@t/info.txt"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"format"
				]
			},
			{
				name => "operator",
				param => [
					"%l"
				]
			},
			{
				name => "operator",
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
				name => "action_set",
				param => [
					"-",
					"label",
					"\@t/info.txt"
				]
			},
			{
				name => "action_set",
				param => [
					"-",
					"format"
				]
			},
			{
				name => "operator",
				param => [
					"%l"
				]
			},
			{
				name => "operator",
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

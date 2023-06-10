

#include "../rush00.h"


void	setchar(int whichOne, t_ro *options)
{
	// Rush 00
	if (whichOne == 0)
	{
		options->left_top = 'o';
		options->right_top = 'o';
		options->left_down = 'o';
		options->right_down = 'o';
		options->hor_fil = '-';
		options->ver_fil = '|';
	}
	else if (whichOne == 1)
	{
		options->left_top = '/';
		options->right_top = '\\';
		options->left_down = '\\';
		options->right_down = '/';
		options->hor_fil = '*';
		options->ver_fil = '*';
	}
	else if (whichOne == 2)
	{
		options->left_top = 'A';
		options->right_top = 'A';
		options->left_down = 'C';
		options->right_down = 'C';
		options->hor_fil = 'B';
		options->ver_fil = 'B';
	}
	else if (whichOne == 3)
	{
		options->left_top = 'A';
		options->right_top = 'C';
		options->left_down = 'A';
		options->right_down = 'C';
		options->hor_fil = 'B';
		options->ver_fil = 'B';
	}
	else if (whichOne == 4)
	{
		options->left_top = 'A';
		options->right_top = 'C';
		options->left_down = 'C';
		options->right_down = 'A';
		options->hor_fil = 'B';
		options->ver_fil = 'B';
	}
	else
		;

}


void	rush(int x, int y, int whichOne, t_ro *options)
{
	int	width;
	int	height;

	setchar(whichOne, options);
	width = 0;
	height = 0;
	while (height < y)
	{
		while (width < x)
		{
			if ((width == 0 && height == 0))
				write(1, &(options->left_top), 1);
			else if (width == x - 1 && height == 0)
				write(1, &(options->right_top), 1);
			else if ((width == 0 && height == y - 1))
				write(1, &(options->left_down), 1);
			else if (width == x - 1 && height == y - 1)
				write(1, &(options->right_down), 1);
			else if ((height == 0 && width != 0) || (height == y-1 && width != 0))
				write(1, &(options->hor_fil), 1);
			else if ((height != 0 && width == 0) || (height != 0 && width == x-1))
				write (1, &(options->ver_fil), 1);
			else
				write(1, " ", 1);
			width++;
		}
		width = 0;
		height++;
		write(1, "\n", 1);
	}
}